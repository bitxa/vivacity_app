import 'package:flutter/material.dart';
import 'package:vivacity_app/providers/provider_shopping.dart';

class ShoppingInfo extends StatelessWidget {
  final ShoppingDataModel shopping;

  const ShoppingInfo({Key? key, required this.shopping}) : super(key: key);

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
        title: Text('Detalles de Tienda'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen principal de la tienda
            Container(
              height: 250,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image.network(
                  shopping.imageURL!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Información básica
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shopping.name!,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Ubicación: ${shopping.ubicacion!}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Hora: ${shopping.hora!}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  Divider(),
                  SizedBox(height: 16),
                  // Contenedores para tipos de ropa
                  ClothingContainer(
                    title: 'Camisetas',
                    imageURL: shopping.camisetas!,
                  ),
                  SizedBox(height: 16),
                  ClothingContainer(
                    title: 'Pantalones',
                    imageURL: shopping.pantalones!,
                  ),
                  SizedBox(height: 16),
                  ClothingContainer(
                    title: 'Zapatos',
                    imageURL: shopping.zapatos!,
                  ),
                  SizedBox(height: 16),
                  ClothingContainer(
                    title: 'Collares',
                    imageURL: shopping.collares!,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Nuevo widget para contenedor de tipos de ropa
class ClothingContainer extends StatelessWidget {
  final String title;
  final String imageURL;

  const ClothingContainer({
    Key? key,
    required this.title,
    required this.imageURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            imageURL,
            fit: BoxFit.cover,
            height: 150,
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}
