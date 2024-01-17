import 'dart:typed_data';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vivacity_app/Eventos/evento.dart';
import 'package:vivacity_app/api/api_client.dart';

class Eventos extends StatefulWidget {
  const Eventos({super.key});

  @override
  _EventosState createState() => _EventosState();
}

class _EventosState extends State<Eventos> {
  String _selectedChip = 'Todos';
  int numberOfEvents = 10;
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
        title: Text('Eventos'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 1),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: '¿Qué te apetece hacer hoy?',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  ),
                ),
              ),
            ),
            _buildScrollableChipsRow(),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10,
                    ), // Added top padding
                    child: Text(
                      '$numberOfEvents resultados', // Display the number of events
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  _buildSectionTitle('Próximo'),
                  _buildImageButton(
                    title: 'New Era',
                    eventDate: "Hoy, 18:00",
                    location: "La Argelia",
                    category: 'FIESTA',
                    imagePath: 'assets/eventos/evento1.jpg',
                    colorLabels: const Color(0xFF3DCCC7).withOpacity(0.75),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),
                  _buildImageButton(
                    eventDate: "Mañana, 19:00",
                    title: 'La Nassa',
                    category: 'FIESTA',
                    location: "La Tebaida",
                    imagePath: 'assets/eventos/nassa.jpg',
                    colorLabels: const Color(0xFF3DCCC7).withOpacity(0.75),
                    onPressed: () {
                      Navigator.pushNamed(context, 'navigationFood');
                    },
                  ),
                  _buildSectionTitle('Siguiente mes'),
                  _buildImageButton(
                    eventDate: "Enero 27, 18:00",
                    title: 'Melendi',
                    location: "ESTADIO REINA DEL CISNE",
                    category: 'CONCIERTO',
                    imagePath: 'assets/eventos/melendi.jpg',
                    colorLabels: const Color(0xFFFF8080).withOpacity(0.75),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventDetailScreen(
                            eventTitle: "Melendi",
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildImageButton(
                    eventDate: "Hoy, 18:00",
                    title: 'Feria de comida',
                    location: "Plaza San Sebastia",
                    category: 'CASA ABIERTA',
                    imagePath: 'assets/home/food.png',
                    colorLabels: const Color(0xFFE5A000).withOpacity(0.75),
                    onPressed: () {
                      Navigator.pushNamed(context, 'navigationFood');
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

  Widget _buildScrollableChipsRow() {
    List<String> labels = [
      'Todos',
      'Fiestas',
      'Conciertos',
      'Casa abierta',
      'Feria ganadera'
    ];
    List<Widget> chips = [];

    for (var label in labels) {
      bool isSelected = _selectedChip == label;
      chips.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
          child: ChoiceChip(
            label: Padding(
              padding: EdgeInsets.only(left: isSelected ? 8.0 : 0),
              child: Text(label),
            ),
            selected: isSelected,
            onSelected: (bool selected) {
              setState(() {
                _selectedChip = label;
              });
            },
            backgroundColor: isSelected
                ? Color.fromARGB(255, 46, 74, 255) // Corrected color
                : Color.fromRGBO(90, 253, 169, 1), // Non-selected color
            labelStyle: TextStyle(
                color: isSelected
                    ? const Color.fromARGB(255, 20, 20, 20)
                    : Colors.black),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: isSelected
                    ? Colors.white
                    : Colors.transparent, // Border color for selected state
                width: 2,
              ),
            ),
            avatar: isSelected
                ? Icon(
                    Icons.check,
                    color: Color.fromARGB(255, 255, 255, 255),
                    size: 20.0,
                  )
                : null,
          ),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: chips),
    );
  }

  Widget _buildImageButton({
    required String title,
    required String category,
    required String imagePath,
    required String eventDate,
    required String location,
    required VoidCallback onPressed,
    required Color colorLabels,
  }) {
    final ApiClient apiClient = ApiClient();

    return FutureBuilder<Uint8List>(
      future: apiClient
          .getFileByPath(imagePath), // Fetch binary image data using your API
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Display loading indicator while fetching data
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final imageBytes = snapshot.data;

          return InkWell(
            onTap: onPressed,
            child: Container(
              height: 140,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: MemoryImage(
                      imageBytes!), // Use MemoryImage to display binary data
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Positioned(
                    top: 15,
                    right: 15,
                    child: Container(
                      width: 100,
                      height: 25,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: colorLabels,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          category.toUpperCase(),
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
                    bottom: 5,
                    left: 10,
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  eventDate,
                                  style: TextStyle(
                                      color: Color(0XFFE1F5A6), fontSize: 14),
                                ),
                                Text(
                                  ("$title , $location").toUpperCase(),
                                  style: TextStyle(
                                      color: Color(0XFFF7F7F7), fontSize: 14),
                                ),
                              ],
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
        } else {
          return Text('No Data'); // Handle the case where no data is available
        }
      },
    );
  }
}

Widget _buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(title,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          )),
    ),
  );
}
