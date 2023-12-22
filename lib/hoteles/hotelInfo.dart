import 'package:flutter/material.dart';
import 'package:vivacity_app/providers/provider_hoteles.dart';

class HotelInfo extends StatelessWidget {
  final HotelesDataModel hotel;

  const HotelInfo({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Hotel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              hotel.imageURL.toString(),
              fit: BoxFit.cover,
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              hotel.name.toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Estrellas: ${hotel.estrellas.toString()}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
