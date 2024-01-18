import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        maxRadius: 30,
                        backgroundImage: AssetImage('assets/home/perfil.png'),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hola',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'James Franco',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: const Color(0xFF549BF3),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 10),
                children: [
                  const SizedBox(height: 16),
                  _buildImageButton(
                    text: 'GASTRONOMIA',
                    imagePath: 'assets/home/food.png',
                    colorLabels: const Color(0xFFE5A000).withOpacity(0.75),
                    onPressed: () {
                      Navigator.pushNamed(context, 'restaurantes');
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildImageButton(
                    text: 'LUGARES',
                    imagePath: 'assets/home/lugares.png',
                    colorLabels: const Color(0xFF3DCCC7).withOpacity(0.75),
                    onPressed: () {
                      Navigator.pushNamed(context, 'lugares');
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildImageButton(
                    text: 'HOSPEDAJE',
                    imagePath: 'assets/home/hotel.png',
                    colorLabels: const Color(0xFF0A90CF).withOpacity(0.75),
                    onPressed: () {
                      Navigator.pushNamed(context, 'hoteles');
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildImageButton(
                    text: 'EVENTOS',
                    imagePath: 'assets/home/event.png',
                    colorLabels: const Color(0xFFFF8080).withOpacity(0.75),
                    onPressed: () {
                      Navigator.pushNamed(context, 'eventos');
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildImageButton(
                    text: 'SHOPPING',
                    imagePath: 'assets/home/shop.png',
                    colorLabels: const Color(0xFFAECA5E).withOpacity(0.75),
                    onPressed: () {
                      Navigator.pushNamed(context, 'shopping');
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildImageButton(
                    text: 'BAR - DISCO',
                    imagePath: 'assets/home/party.png',
                    colorLabels: const Color(0xFFEE63E3).withOpacity(0.75),
                    onPressed: () {
                      Navigator.pushNamed(context, 'bar');
                    },
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

Widget _buildImageButton({
  required String text,
  required String imagePath,
  required VoidCallback onPressed,
  required Color colorLabels,
}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      height: 140,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 15,
            right: 15,
            child: Container(
              width: 100,
              height: 25,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: colorLabels,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  text,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
