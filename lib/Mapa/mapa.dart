import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  LatLng _currentLocation = const LatLng(45.521563, -122.677433);
  Set<Marker> _markers = {};
  String _mapStyle = '';
  Set<Polyline> _polylines = {};
  PolylinePoints polylinePoints = PolylinePoints();
  LatLng? _selectedDestination;

  @override
  void initState() {
    super.initState();
    _loadMapStyle();
    _getUserLocation();
  }

  Future<void> _loadMapStyle() async {
    _mapStyle = await rootBundle.loadString('assets/map_style.json');
    setState(() {});
  }

  Future<BitmapDescriptor> _createBitmapDescriptor(
      IconData iconData, Color color) async {
    final pictureRecorder = ui.PictureRecorder();
    final canvas = Canvas(pictureRecorder);
    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    textPainter.text = TextSpan(
      text: String.fromCharCode(iconData.codePoint),
      style: TextStyle(
        letterSpacing: 0.0,
        fontSize: 50,
        fontFamily: iconData.fontFamily,
        package: iconData.fontPackage,
        color: color,
      ),
    );

    textPainter.layout();
    textPainter.paint(canvas, Offset.zero);
    final picture = pictureRecorder.endRecording();
    final image = await picture.toImage(70, 70);
    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(bytes!.buffer.asUint8List());
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(_mapStyle);

    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('comida_test'),
          position: LatLng(45.521563, -122.677433), // Example position
          icon: BitmapDescriptor
              .defaultMarker, // Use a default marker for testing
          infoWindow: InfoWindow(title: 'Comida Test'),
        ),
      );
    });

    _createCustomIcons();
  }

  void _createCustomIcons() async {
    for (var tag in tags) {
      final BitmapDescriptor icon =
          await _createBitmapDescriptor(tag.iconData, tag.color);
      _placeTagPins(icon, tag.label);
      print(tag.label);
    }
  }

  void _placeTagPins(BitmapDescriptor icon, String label) {
    final math.Random random = math.Random();

    int numberOfMarkers = random.nextInt(20) + 10;
    for (int i = 0; i < numberOfMarkers; i++) {
      final double offsetLat = (random.nextDouble() * 0.02) - 0.005;
      final double offsetLng = (random.nextDouble() * 0.02) - 0.005;
      LatLng position = LatLng(
        _currentLocation.latitude + offsetLat,
        _currentLocation.longitude + offsetLng,
      );

      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId('${label}_$i'),
            position: position,
            icon: icon,
            infoWindow: InfoWindow(title: label),
            onTap: () {
              _selectedDestination = position;
              _showPlaceDetailsBottomSheet(context);
            },
          ),
        );
      });
    }
  }

  Future<void> _createRoute(
      LatLng originLatLng, LatLng destinationLatLng) async {
    // Convert the LatLng objects to PointLatLng required by the PolylinePoints class
    PointLatLng origin =
        PointLatLng(originLatLng.latitude, originLatLng.longitude);
    PointLatLng destination =
        PointLatLng(destinationLatLng.latitude, destinationLatLng.longitude);

    // Call the method and pass the required parameters
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyDLFD-nh_AG2ErJ75jy_L_O_UFyiuNMtoE",
      origin,
      destination,
      travelMode: TravelMode.driving,
      optimizeWaypoints: true,
    );

    // Check if the result is successful
    if (result.status == 'OK') {
      // The result contains an encoded polyline string that needs to be decoded
      List<PointLatLng> points = result.points;

      // Decode the result to get the polyline coordinates
      List<LatLng> polylineCoordinates = points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();

      // Use setState to update the polylines on the map
      setState(() {
        _polylines.add(
          Polyline(
            polylineId: PolylineId('route'),
            points: polylineCoordinates,
            width: 5,
            color: Colors.blue,
            // If you want to make the polyline more precise, you can set the geodesic property to true
            geodesic: true,
          ),
        );
      });
    } else {
      print('Error: ${result.errorMessage}');
    }
  }

  Future<void> _getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();

    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: _currentLocation,
            zoom: 15.0,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _currentLocation,
              zoom: 16.0,
            ),
            indoorViewEnabled: true,
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            polylines: _polylines,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              runSpacing: 5.0,
              spacing: 5.0,
              children: tags
                  .map((tag) => buildCustomElevatedButton(
                        backgroundColor: tag.color,
                        labelColor: Colors.white,
                        label: tag.label,
                        iconData: tag.iconData,
                        onPressed: () {
                          // Handle tag button press
                        },
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(top: 70, right: 20),
        width: 55,
        height: 55,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3), // Shadow color
                spreadRadius: 0.1, // Spread radius
                blurRadius: 2, // Blur radius
                offset: Offset(0, 1), // Offset in the x and y direction
              ),
            ]),
        child: IconButton(
          onPressed: _getUserLocation,
          icon: Icon(FontAwesomeIcons.locationCrosshairs),
          color: Color(0XFF616161),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }

  void _showPlaceDetailsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor:
          Colors.transparent, // Make the modal background transparent
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.5, // Set this value to half the screen height
        minChildSize: 0.5, // Set this value to the minimum height you want
        maxChildSize: 0.7, // Set this value to the maximum height you want
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: ListView(
            controller: controller,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(height: 16),
              Text(
                'El Caribe',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Chip(
                  label: Text(
                    'ABIERTO',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.green,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Este restaurante especializado en comida de mar, sobresale '
                'por sus exquisitos pescados en varias preparaciones, sus '
                'mariscos y sus vinos.',
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildInfoColumn('10 min', FontAwesomeIcons.bus),
                  _buildInfoColumn('10 min', FontAwesomeIcons.car),
                  _buildInfoColumn('10 min', FontAwesomeIcons.personWalking),
                ],
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () {
                  // Handle 'Ver más' action
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Ver más'),
                    Icon(Icons.more_vert),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(top: 1.0),
                child: ImageCarousel(
                  imagePaths: [
                    'https://www.eluniverso.com/resizer/9pBwonr6vl9S_8woISSM9uIACQM=/1000x667/smart/filters:quality(70)/cloudfront-us-east-1.images.arcpublishing.com/eluniverso/GUVUR2ITPZGZ5D2C2YR3C3JXQA.jpg', // Replace with your actual asset paths
                    'https://lenasycarbon.com/wp-content/uploads/2023/06/PARRILLADA-COMPLETA.png',
                    'https://www.goya.com/media/7962/chicken-shrimp-and-steak-parrillada.jpg?quality=80',
                  ],
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  _createRoute(_currentLocation, _selectedDestination!);
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.directions),
                label: Text('Iniciar ruta'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  onPrimary: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String text, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 28),
        SizedBox(height: 8),
        Text(text),
      ],
    );
  }
}

class LocationTag {
  final Color color;
  final IconData iconData;
  final String label;

  LocationTag(
      {required this.color, required this.iconData, required this.label});
}

Widget buildCustomElevatedButton({
  required Color backgroundColor,
  required Color labelColor,
  required String label,
  required IconData iconData,
  required VoidCallback onPressed,
}) {
  return ElevatedButton.icon(
    onPressed: onPressed,
    icon: Icon(iconData, color: labelColor),
    label: Text(label, style: TextStyle(color: labelColor)),
    style: ElevatedButton.styleFrom(
      primary: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    ),
  );
}

final List<LocationTag> tags = [
  LocationTag(
    color: Color(0XFFBEADFA),
    iconData: FontAwesomeIcons.pizzaSlice,
    label: 'Comida',
  ),
  LocationTag(
    color: Color(0XFF8EACCD),
    iconData: FontAwesomeIcons.martiniGlass,
    label: 'Bebidas',
  ),
  LocationTag(
    color: Color(0XFF374259),
    iconData: FontAwesomeIcons.bagShopping,
    label: 'Shopping',
  ),
  LocationTag(
    color: Color(0XFF6155A6),
    iconData: FontAwesomeIcons.calendar,
    label: 'Eventos',
  ),
  LocationTag(
    color: Color(0XFFFF8080),
    iconData: FontAwesomeIcons.bed,
    label: 'Estancia',
  ),
];

class ImageCarousel extends StatelessWidget {
  final List<String> imagePaths;

  ImageCarousel({required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        aspectRatio: 16 / 9,
        initialPage: 0,
      ),
      items: imagePaths.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(
                  horizontal: 1.0), // Spacing between items
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(10), // Rounded corners for the images
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.network(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
