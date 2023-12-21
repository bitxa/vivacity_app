// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // Alinea los elementos al principio y al final
              children: [
                Row(
                  children: const [
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: AssetImage('assets/home/perfil.png'),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hola',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'James Franco',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    // Acciones al hacer clic en el icono de notificaciones
                  },
                  icon: const Icon(Icons.notifications),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildImageButton(
                    text: 'Ir a Pantalla 1',
                    imagePath: 'assets/home/tour.png',
                    onPressed: () {
                      Navigator.pushNamed(context, 'pantalla1');
                    },
                  ),
                  SizedBox(height: 16),
                  _buildImageButton(
                    text: 'Ir a Pantalla 2',
                    imagePath: 'assets/home/food.png',
                    onPressed: () {
                      Navigator.pushNamed(context, 'pantalla2');
                    },
                  ),
                  SizedBox(height: 16),
                  _buildImageButton(
                    text: 'Ir a Pantalla 1',
                    imagePath: 'assets/home/lugares.png',
                    onPressed: () {
                      Navigator.pushNamed(context, 'pantalla1');
                    },
                  ),
                  SizedBox(height: 16),
                  _buildImageButton(
                    text: 'Ir a Pantalla 2',
                    imagePath: 'assets/home/hotel.png',
                    onPressed: () {
                      Navigator.pushNamed(context, 'hotel');
                    },
                  ),
                  SizedBox(height: 16),
                  _buildImageButton(
                    text: 'Ir a Pantalla 1',
                    imagePath: 'assets/home/event.png',
                    onPressed: () {
                      Navigator.pushNamed(context, 'pantalla1');
                    },
                  ),
                  SizedBox(height: 16),
                  _buildImageButton(
                    text: 'Ir a Pantalla 2',
                    imagePath: 'assets/home/shop.png',
                    onPressed: () {
                      Navigator.pushNamed(context, 'pantalla2');
                    },
                  ),
                  SizedBox(height: 16),
                  _buildImageButton(
                    text: 'Ir a Pantalla 1',
                    imagePath: 'assets/home/party.png',
                    onPressed: () {
                      Navigator.pushNamed(context, 'pantalla1');
                    },
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildImageButton({
  required String text,
  required String imagePath,
  required VoidCallback onPressed,
}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      height: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
