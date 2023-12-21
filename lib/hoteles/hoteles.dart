import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vivacity_app/providers/provider_hoteles.dart';
import 'hotelInfo.dart'; // Importa la nueva página

class HotelesPage extends StatelessWidget {
  const HotelesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            icon: Icon(FontAwesomeIcons.listUl),
            onSelected: (value) {
              // Aquí puedes manejar la selección del menú
              // Por ahora, solo imprime el valor seleccionado
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'Con alberca',
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.swimmingPool),
                      SizedBox(width: 8),
                      Text('Con alberca'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Cabañas',
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.house),
                      SizedBox(width: 8),
                      Text('Cabañas'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Hoteles',
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.hotel),
                      SizedBox(width: 8),
                      Text('Hoteles'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'MiniCasa',
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.home),
                      SizedBox(width: 8),
                      Text('MiniCasa'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Camping',
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.campground),
                      SizedBox(width: 8),
                      Text('Camping'),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: _readJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("Error al cargar los datos"));
          } else if (data.hasData) {
            var items = data.data as List<HotelesDataModel>;
            return ListView.builder(
              itemCount: items == null ? 0 : items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HotelInfo(
                          hotel: items[index],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Container(
                      height: 200,
                      child: Stack(
                        children: [
                          Image.network(
                            items[index].imageURL.toString(),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 60,
                              color: Colors.black.withOpacity(0.5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 12),
                                    child: Text(
                                      items[index].name.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 12),
                                    child: Row(
                                      children: [
                                        Text(
                                          items[index].estrellas.toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
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
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<HotelesDataModel>> _readJsonData() async {
    try {
      final jsondata =
          await rootBundle.rootBundle.loadString('data/hoteles.json');
      final list = json.decode(jsondata) as List<dynamic>;
      return list.map((e) => HotelesDataModel.fromJson(e)).toList();
    } catch (e) {
      print('Error al cargar datos desde el archivo JSON: $e');
      throw e;
    }
  }
}
