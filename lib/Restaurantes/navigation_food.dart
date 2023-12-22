import 'package:flutter/material.dart';
import 'package:vivacity_app/Home/Home.dart';
import 'package:vivacity_app/Restaurantes/restaurantes.dart';

class NavigationFood extends StatefulWidget {
  const NavigationFood({Key? key}) : super(key: key);

  @override
  State<NavigationFood> createState() => _NavigationState();
}

class _NavigationState extends State<NavigationFood> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Restaurantes(), // Muestra Restaurantes por defecto
    const Home(),
    const Home(),
    const Home(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
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
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
