import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vivacity_app/Favoritos/favoritos.dart';
import 'package:vivacity_app/Home/home.dart';
import 'package:vivacity_app/Mapa/mapa.dart';
import 'package:vivacity_app/Perfil/perfil.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<Navigation> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  Future<bool> _onWillPop() async {
    if (_selectedIndex != 0) {
      setState(() {
        _selectedIndex = 0;
      });
      _pageController.jumpToPage(0);
      return false;
    }
    return true; // Allow the system to handle the back button (e.g., exit the app)
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: const [Home(), MapScreen(), Favoritos(), Perfil()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          onTap: _onItemTapped,
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
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
