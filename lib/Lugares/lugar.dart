// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Lugar extends StatelessWidget {
  const Lugar({Key? key}) : super(key: key);

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
                height: 303,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildDestacadosButton(
                      imagePath: 'assets/lugares/jipiroG.png',
                      colorLabels: const Color(0xFF2D2D2D).withOpacity(0.75),
                      onPressed: () {
                        Navigator.pushNamed(context, 'lugares');
                      },
                      width: 360,
                      height: 484,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Un parque maravilloso',
                style: GoogleFonts.roboto(
                  fontSize: 15,
                  color: const Color(0xFF4A5F78),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enimLorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh.',
                style: GoogleFonts.roboto(
                  fontSize: 13,
                  color: const Color(0xFF4E4C4C),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Horarios de visita',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: const Color(0xFFE5A000),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '8:00 am - 21:00 pm',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: const Color(0xFF4E4C4C),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Galería',
                style: GoogleFonts.inter(
                    fontSize: 12,
                    color: const Color(0xFF4E4C4C),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 120, // Altura deseada para los elementos horizontales
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryButton(
                      imagePath: 'assets/lugares/jipiro1.png',
                      onPressed: () {
                        Navigator.pushNamed(context, 'galeria');
                      },
                    ),
                    const SizedBox(width: 16),
                    _buildCategoryButton(
                      imagePath: 'assets/lugares/jipiro.png',
                      onPressed: () {
                        Navigator.pushNamed(context, 'galeria');
                      },
                    ),
                    const SizedBox(width: 16),
                    _buildCategoryButton(
                      imagePath: 'assets/lugares/jipiro2.png',
                      onPressed: () {
                        Navigator.pushNamed(context, 'galeria');
                      },
                    ),
                    const SizedBox(width: 16),
                    _buildCategoryButton(
                      imagePath: 'assets/lugares/jipiro3.png',
                      onPressed: () {
                        Navigator.pushNamed(context, 'galeria');
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16), // Espaciador entre secciones
              Text(
                '¿Qué tengo cerca?',
                style: GoogleFonts.inter(
                    fontSize: 12,
                    color: const Color(0xFF4E4C4C),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 124,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildVisitadosButton(
                      titulo: 'Jipiro',
                      subtitulo: 'Loja',
                      imagePath: 'assets/lugares/jipiro.png',
                      onPressed: () {},
                      width: 254,
                      height: 124,
                    ),
                    const SizedBox(width: 16),
                    _buildVisitadosButton(
                      titulo: 'Jipiro',
                      subtitulo: 'Loja',
                      imagePath: 'assets/lugares/jipiro.png',
                      onPressed: () {},
                      width: 254,
                      height: 124,
                    ),
                    // Agregar más elementos si es necesario
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildDestacadosButton({
  required String imagePath,
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
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(45),
      ),
      alignment: Alignment.center,
      child: Stack(
        children: [
          Positioned(
            top: 15,
            right: 15,
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
                  icon: const Icon(FontAwesomeIcons.shareNodes),
                  onPressed: onPressed,
                  color: Colors.white,
                  tooltip: 'Compartir',
                ),
              ),
            ),
          ),
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

Widget _buildVisitadosButton({
  required String titulo,
  required String subtitulo,
  required String imagePath,
  required VoidCallback onPressed,
  required double width,
  required double height,
}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imagePath,
                  width: 111,
                  height: 102,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 35,
              left: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    subtitulo,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
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

Widget _buildCategoryButton({
  required String imagePath,
  required VoidCallback onPressed,
}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: 100,
      height: 78,
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
