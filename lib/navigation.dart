import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vivacity_app/Home/home.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Home(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFE5A000),
        unselectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.locationDot),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.heartCirclePlus),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userLarge),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
