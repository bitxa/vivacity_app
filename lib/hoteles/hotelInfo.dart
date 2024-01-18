import 'package:flutter/material.dart';
import 'package:vivacity_app/providers/provider_hoteles.dart';

class HotelInfo extends StatelessWidget {
  final HotelesDataModel hotel;

  HotelInfo({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Detalles del Hotel'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Foto de la habitación
            Container(
              height: 200,
              child: Image.network(
                hotel.habitacion.toString(),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            // Información existente
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotel.name.toString(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      SizedBox(width: 8),
                      Text(
                        hotel.estrellas.toString(),
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Comodidades',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  buildAmenityRows(),
                ],
              ),
            ),
            // Contenedor adicional con bordes redondeados
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Foto de la habitación
                  Image.network(
                    hotel.habitacion.toString(),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 150,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Habitación Estándar, 1 Cama King',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('344 pies cuadrados'),
                  Text('Wifi incluido'),
                  Text('Desayuno incluido'),
                  Text('Para 3 personas'),
                  Text('1 Cama King'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAmenityRows() {
    List<Widget> amenities = [];
    for (int i = 0; i < comodidades.length; i += 2) {
      Widget amenityRow;
      if (i + 1 < comodidades.length) {
        amenityRow = Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildAmenity(comodidades[i]),
            Spacer(),
            buildAmenity(comodidades[i + 1]),
          ],
        );
      } else {
        amenityRow = Row(
          children: [
            buildAmenity(comodidades[i]),
            Spacer(),
          ],
        );
      }
      amenities.add(amenityRow);
    }

    return Column(children: amenities);
  }

  Widget buildAmenity(String amenity) {
    IconData icon;
    switch (amenity) {
      case 'Pet friendly':
        icon = Icons.pets;
        break;
      case 'Desayuno incluido':
        icon = Icons.free_breakfast;
        break;
      case 'Alberca':
        icon = Icons.pool;
        break;
      case 'Parking incluido':
        icon = Icons.local_parking;
        break;
      case 'Wifi gratis':
        icon = Icons.wifi;
        break;
      case 'Restaurante':
        icon = Icons.restaurant;
        break;
      default:
        icon = Icons.check;
    }

    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 8),
        Text(amenity),
      ],
    );
  }

  final List<String> comodidades = [
    'Pet friendly',
    'Desayuno incluido',
    'Alberca',
    'Parking incluido',
    'Wifi gratis',
    'Restaurante',
  ];
}
