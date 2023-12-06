// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vivacity_app/Authentication/login.dart';
import 'package:vivacity_app/navigation.dart';

final List<String> imgList = [
  'assets/initial_carousel/1.png',
  'assets/initial_carousel/2.png',
  'assets/initial_carousel/3.png',
  'assets/initial_carousel/4.png',
  'assets/initial_carousel/5.png',
];

final List<Widget> textOverlays = [
  TextOverlayWidget(
    title: 'Vive al máximo la experiencia definitiva',
    subtitle:
        'La ciudad interactúa contigo. No te pierdas nada de lo que sucede a tu alrededor. Nosotros te diremos cómo...',
  ),

  TextOverlayWidget(
    title: 'Obten tu agenda personalizada',
    subtitle:
        'Así puedes disfrutar de las más diversas actividades culturales en la ciudad, danza, música, teatro, exposiciones artísticas, emprendimientos, congresos, etc.',
  ),

  TextOverlayWidget(
    title: 'Recorre los lugares más fascinantes',
    subtitle:
        'Cada uno de los lugares de esta ciudad tiene su historia, así que puedes conocer mas de ella y de su gente, recórrela y conoce más detalles con los puntos de realidad aumentada...',
  ),

  TextOverlayWidget(
    title: 'Una experiencia virtual más cerca de lo que te imaginas',
    subtitle:
        'Disfruta de la ciudad, sumérgete en una nueva experiencia, mediante recorridos virtuales de varios lugares y conoce más de ellos...',
  ),
  TextOverlayWidget(
    title: 'Obten grandes beneficios con nuestras marcas aliadas',
    subtitle:
        'Descuentos y promociones en varios lugares como: hoteles, bares, restaurantes etc. Regístrate y consíguelos.',
  ),
];

class TextOverlayWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const TextOverlayWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE5A000),
                  decoration: TextDecoration.none),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 17, 10, 60),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  decoration: TextDecoration.none),
            ),
          ),
        ],
      ),
    );
  }
}

class InitialCarousel extends StatefulWidget {
  @override
  _InitialCarouselState createState() => _InitialCarouselState();
}

class _InitialCarouselState extends State<InitialCarousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CarouselSlider.builder(
            itemCount: imgList.length,
            itemBuilder: (context, index, realIndex) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      imgList[index],
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    ),
                    Positioned(
                      bottom: 60.0, // Adjust the positioning as needed
                      left: 0,
                      right: 0,
                      child: textOverlays[index],
                    ),
                  ],
                ),
              );
            },
            options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 6),
                viewportFraction: 1.0,
                aspectRatio: MediaQuery.of(context).size.aspectRatio,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            carouselController: _controller,
          ),
          Positioned(
            bottom: 15.0, // Position your indicators at the bottom
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == entry.key
                          ? Color(0xFFFFD600) // Active indicator color
                          : Colors.white
                              .withOpacity(0.4), // Inactive indicator color
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Login()),
                    ); // Replace with your navigation logic.
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.close,
                        size: 24.0,
                        color: Color(0xFFE5A000),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
