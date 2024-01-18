import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Galeria extends StatelessWidget {
  const Galeria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB3B3B8).withOpacity(0.15),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 90,
                child: Row(
                  children: [
                    _buildDestacadosButton(
                      colorLabels: const Color(0xFF2D2D2D).withOpacity(0.75),
                      onPressed: () {
                        Navigator.pushNamed(context, 'lugar');
                      },
                      width: 100,
                      height: 60,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Galeria',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 700,
                width: 350,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          _buildCategoryButton(
                            imagePath: 'assets/lugares/jipiro1.png',
                            onPressed: () {},
                          ),
                          const SizedBox(height: 16),
                          _buildCategoryButton(
                            imagePath: 'assets/lugares/jipiro.png',
                            onPressed: () {},
                          ),
                          const SizedBox(height: 16),
                          _buildCategoryButton(
                            imagePath: 'assets/lugares/jipiro2.png',
                            onPressed: () {},
                          ),
                          const SizedBox(height: 16),
                          _buildCategoryButton(
                            imagePath: 'assets/lugares/jipiro3.png',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildImageList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageList() {
    return SizedBox(
      height: 700,
      width: 300,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          _buildCategoryButton(
            imagePath: 'assets/lugares/jipiro4.png',
            onPressed: () {},
          ),
          const SizedBox(width: 16),
          _buildCategoryButton(
            imagePath: 'assets/lugares/jipiro5.png',
            onPressed: () {},
          ),
          const SizedBox(width: 16),
          _buildCategoryButton(
            imagePath: 'assets/lugares/jipiro6.png',
            onPressed: () {},
          ),
          const SizedBox(width: 16),
          _buildCategoryButton(
            imagePath: 'assets/lugares/jipiro7.png',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildDestacadosButton({
    required VoidCallback onPressed,
    required Color colorLabels,
    required double width,
    required double height,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
        ),
        alignment: Alignment.center,
        child: Stack(
          children: [
            Positioned(
              top: 15,
              left: 15,
              child: Container(
                width: 51,
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: colorLabels,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: IconButton(
                    icon: const Icon(FontAwesomeIcons.arrowLeft),
                    onPressed: onPressed,
                    color: Colors.white,
                    tooltip: 'Compartir',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton({
    required String imagePath,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 300,
        height: 260,
        margin: const EdgeInsets.only(bottom: 10), // Separación entre elementos
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
