import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Restaurantes extends StatelessWidget {
  const Restaurantes({super.key});

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
        title: Text('Gastronomía'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildImageButton(
                    text: 'TOUR VIRTUAL',
                    imagePath: 'assets/home/tour.png',
                    colorLabels: const Color(0xFFF00A78).withOpacity(0.75),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),
                  _buildImageButton(
                    text: 'GASTRONOMIA',
                    imagePath: 'assets/home/food.png',
                    colorLabels: const Color(0xFFE5A000).withOpacity(0.75),
                    onPressed: () {
                      Navigator.pushNamed(context, 'navigationFood');
                    },
                  ),
                  const SizedBox(height: 16),
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
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: Stack(
        children: [
          Positioned(
            top: 15,
            right: 15,
            child: FittedBox(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: colorLabels,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25),
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
          ),
        ],
      ),
    ),
  );
}
