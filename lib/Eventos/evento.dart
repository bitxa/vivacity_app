// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vivacity_app/api/api_client.dart';

class EventDetailScreen extends StatelessWidget {
  final String eventTitle;

  const EventDetailScreen({
    Key? key,
    required this.eventTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApiClient apiClient = ApiClient();
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        actions: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.black, // Background color
              shape: BoxShape.circle, // Circular shape
            ),
            child: IconButton(
              icon: Icon(Icons.favorite_border), // Heart icon
              color: Colors.white, // Icon color
              onPressed: () {
                // Your button tap action herea
              },
            ),
          )
        ], //
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: FutureBuilder<Uint8List>(
                    future: apiClient.getFileByPath(
                        'assets/eventos/melendi.jpg'), // Fetch binary image data using your API
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(); // Display loading indicator while fetching data
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        final imageBytes = snapshot.data;

                        return Image.memory(
                          imageBytes!, // Use MemoryImage to display binary data
                          width: MediaQuery.of(context).size.width - 20,
                          height: 200,
                          fit: BoxFit.cover,
                        );
                      } else {
                        return Text(
                            'No Data'); // Handle the case where no data is available
                      }
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Melendi',
                          style: TextStyle(
                              color: Color(0XFF73777E),
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Likes y cicatrices tour',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0XFF43454C),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Color(0XFF43454C),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Estadio Alejandro Serrano Aguilar",
                            style: TextStyle(
                              color: Color(0XFF43454C),
                              fontSize: 13,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0XFFE9EAED),
                      height: 20,
                      thickness: 2,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            10), // Adjust for rounded corners
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "30\n",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors
                                        .black, // Replace with the color you need
                                  ),
                                ),
                                TextSpan(
                                  text: "NOV",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors
                                        .black, // Replace with the color you need
                                  ),
                                ),
                              ],
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.grey,
                            width: 20,
                            thickness: 2,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Jueves",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Empieza 19:00 PM - Termina 22:00 PM",
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(FontAwesomeIcons.calendarPlus,
                                color: Color(
                                    0XFFE5A000)), // Replace with the color you need
                            onPressed: () {
                              // Your action here
                            },
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0XFFE9EAED),
                      height: 20,
                      thickness: 2,
                    ),
                    Text(
                      "Disfruta de la nueva y última gira de Melendi por Ecuador.",
                      style: TextStyle(color: Color(0XFF73777E), fontSize: 13),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ImageCarousel(
                        imagePaths: [
                          'assets/eventos/melendi/1.jpg', // Replace with your actual asset paths
                          'assets/eventos/melendi/2.jpeg',
                          'assets/eventos/melendi/3.jpg',
                          // Add as many paths as you have images
                        ],
                      ),
                    ),
                  ]),
            ) // Continue building out your event details

            ,
            EventMap(),
          ],
        ),
      ),
    );
  }
}

class EventMap extends StatefulWidget {
  @override
  _EventMapState createState() => _EventMapState();
}

class _EventMapState extends State<EventMap> {
  late GoogleMapController mapController;
  Set<Marker> _markers = {};
  String _mapStyle = '';

  @override
  Widget build(BuildContext context) {
    LatLng _currentLocation = const LatLng(45.521563, -122.677433);

    return Container(
      // Define the size and other UI properties for the map container
      height: 250, // Example height for the map area
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _currentLocation,
            zoom: 16.0,
          ),
          indoorViewEnabled: true,
          markers: _markers,
          myLocationEnabled: true,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadMapStyle();
  }

  Future<void> _loadMapStyle() async {
    _mapStyle = await rootBundle.loadString('assets/map_style.json');
    setState(() {});
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
  }
}

class ImageCarousel extends StatelessWidget {
  final List<String> imagePaths; // Your list of image paths/assets

  ImageCarousel({required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay:
            true, // Set to false if you do not want the carousel to auto play
        enlargeCenterPage: true, // Non-central images will be smaller
        viewportFraction: 0.8, // Adjust the size of the pages
        aspectRatio: 16 / 9, // Aspect ratio of the carousel
        initialPage: 0,
      ),
      items: imagePaths.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            final ApiClient apiClient = new ApiClient();
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: FutureBuilder<Uint8List>(
                future: apiClient.getFileByPath(
                    imagePath), // Fetch binary image data using your API
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(); // Display loading indicator while fetching data
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final imageBytes = snapshot.data;

                    return ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.memory(
                        imageBytes!, // Use MemoryImage to display binary data
                        fit: BoxFit.cover,
                      ),
                    );
                  } else {
                    return Text(
                        'No Data'); // Handle the case where no data is available
                  }
                },
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
