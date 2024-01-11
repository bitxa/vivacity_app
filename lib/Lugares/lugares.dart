// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Lugares extends StatelessWidget {
  const Lugares({Key? key}) : super(key: key);

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
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  // Lógica de búsqueda aquí
                  print('Realizar búsqueda');
                },
                child: Container(
                  width: 334,
                  height: 47,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white, // Fondo blanco
                    border: Border.all(color: Colors.grey), // Borde gris
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.search),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '¿Qué te apetece hacer hoy?',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: const Color.fromARGB(151, 41, 45, 50),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Destacados',
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, 'mapa');
                    },
                    label: const Text('Explorar Mapa'),
                    icon: Image.asset('assets/lugares/maps.png'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.grey,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 303,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildDestacadosButton(
                      text: '10 km',
                      imagePath: 'assets/lugares/villonaco.png',
                      colorLabels: const Color(0xFF549BF3).withOpacity(0.75),
                      onPressed: () {},
                      width: 238,
                      height: 303,
                      title: 'Parque Éolico Villonaco',
                      subtitle: 'Loja',
                    ),
                    const SizedBox(width: 16),
                    _buildDestacadosButton(
                      text: '10 km',
                      imagePath: 'assets/lugares/puerta.png',
                      colorLabels: const Color(0xFF549BF3).withOpacity(0.75),
                      onPressed: () {},
                      width: 238,
                      height: 303,
                      title: 'Puerta de la ciudad',
                      subtitle: 'Loja',
                    ),
                    // Agregar más elementos si es necesario
                  ],
                ),
              ),
              const SizedBox(height: 16), // Espaciador entre secciones
              Text(
                'Más visitados',
                style: GoogleFonts.inter(
                    fontSize: 20,
                    color: Colors.black,
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
                      onPressed: () {
                        Navigator.pushNamed(context, 'lugar');
                      },
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
              const SizedBox(height: 16), // Espaciador entre secciones
              Text(
                'Categorías',
                style: GoogleFonts.inter(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 120, // Altura deseada para los elementos horizontales
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryButton(
                      text: 'Aventura',
                      imagePath: 'assets/lugares/aventura.png',
                      colorLabels: const Color(0xFF3DCCC7).withOpacity(0.75),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 16),
                    _buildCategoryButton(
                      text: 'Acampar',
                      imagePath: 'assets/lugares/acampar.png',
                      colorLabels: const Color(0xFFE57373).withOpacity(0.75),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 16),
                    _buildCategoryButton(
                      text: 'Rodar',
                      imagePath: 'assets/lugares/rodar.png',
                      colorLabels: const Color(0xFF3DCCC7).withOpacity(0.75),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 16),
                    _buildCategoryButton(
                      text: 'Naturaleza',
                      imagePath: 'assets/lugares/naturaleza.png',
                      colorLabels: const Color(0xFFE57373).withOpacity(0.75),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 16),
                    _buildCategoryButton(
                      text: 'Mercado',
                      imagePath: 'assets/lugares/mercado.png',
                      colorLabels: const Color(0xFF3DCCC7).withOpacity(0.75),
                      onPressed: () {},
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
}

Widget _buildDestacadosButton({
  required String text,
  required String imagePath,
  required String title,
  required String subtitle,
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
              width: 53,
              height: 27,
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
          Positioned(
            bottom: 10,
            left: 25,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(1, 1),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 12,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(1, 1),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ],
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
  required String text,
  required String imagePath,
  required VoidCallback onPressed,
  required Color colorLabels,
}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: 74,
      height: 74,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.scaleDown,
        ),
        shape: BoxShape.circle,
        border: Border.all(color: colorLabels, width: 2),
      ),
      alignment: Alignment.center,
      child: Stack(
        children: [
          Positioned(
            top: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: colorLabels,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
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
