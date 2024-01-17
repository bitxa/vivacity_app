import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vivacity_app/api/api_client.dart';

class Favoritos extends StatefulWidget {
  const Favoritos({Key? key}) : super(key: key);

  @override
  _FavoritosState createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  int _selectedIndex = 0; // First item selected by default
  final List<ListItem> items = [
    ListItem(
      title: 'Sonesta',
      imageUrl: 'assets/favourites/sonesta.png',
      category: 'HOSPEDAJE',
      color: Colors.blue, // Specific color for HOSPEDAJE
    ),
    ListItem(
      title: 'El caribe',
      imageUrl: 'assets/favourites/food.png',
      category: 'COMIDA',
      color: Colors.green, // Specific color for COMIDA
    ),
    // Add more items as needed
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mis favoritos')),
      body: Column(
        children: [
          Container(
            color: Color(0xFFFFC94A),
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List<Widget>.generate(6, (index) {
                  IconData iconData;
                  switch (index) {
                    case 0:
                      iconData = FontAwesomeIcons.borderAll;
                      break;
                    case 1:
                      iconData = FontAwesomeIcons.pizzaSlice;
                      break;
                    case 2:
                      iconData = FontAwesomeIcons.bed;
                      break;
                    case 3:
                      iconData = FontAwesomeIcons.bagShopping;
                      break;
                    case 4:
                      iconData = FontAwesomeIcons.martiniGlass;
                      break;
                    case 5:
                      iconData = FontAwesomeIcons.calendar;
                      break;
                    default:
                      iconData = FontAwesomeIcons.questionCircle;
                      break;
                  }
                  return MenuButton(
                    icon: iconData,
                    isSelected: _selectedIndex == index,
                    onTap: () => _onItemTap(index),
                  );
                }),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return CategoryCard(
                  item: items[index],
                  categoryColor:
                      items[index].color, // Pass the color to the constructor
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const MenuButton({
    Key? key,
    required this.icon,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.0),
        child: Icon(
          icon,
          size: 35.0,
          color: isSelected ? Colors.white : Color(0XFF5C5C5C),
        ),
      ),
    );
  }
}

class ListItem {
  final String title;
  final String imageUrl;
  final String category;
  final Color color; // Color field

  ListItem({
    required this.title,
    required this.imageUrl,
    required this.category,
    required this.color, // Initialize the color field
  });
}

class CategoryCard extends StatelessWidget {
  final ListItem item;
  final Color categoryColor; // Color parameter for category

  const CategoryCard({
    Key? key,
    required this.item,
    required this.categoryColor, // Required color parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApiClient apiClient = ApiClient();
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          FutureBuilder<Uint8List>(
            future: apiClient
                .getFileByPath(item.imageUrl), // Fetch image asynchronously
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.memory(
                    snapshot.data!,
                    height: 200,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              } else {
                return Center(child: Text('No Data'));
              }
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: Text(
                item.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: categoryColor, // Use passed color
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                item.category,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
