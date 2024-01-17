import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

class ShoppingDataModel {
  int? id;
  String? name;
  String? hora;
  String? imageURL;
  String? ubicacion;

  ShoppingDataModel(
      {this.id, this.name, this.hora, this.imageURL, this.ubicacion});

  ShoppingDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    hora = json['hora'];
    imageURL = json['imageUrl'];
    ubicacion = json['ubicacion'];
  }
}

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tiendas'),
      ),
      body: FutureBuilder(
        future: _readJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("Error al cargar los datos"));
          } else if (data.hasData) {
            var items = data.data as List<ShoppingDataModel>;
            return ListView.builder(
              itemCount: items == null ? 0 : items.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      height: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Image.network(
                                  items[index].imageURL.toString(),
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 12,
                              left: 12,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(0, 0, 0, 0.5),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  items[index].name.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF1F1F1),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.location_on,
                                            color: Color(0xFF4CB29A)),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            'Ubicación: ${items[index].ubicacion.toString()}',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Icon(Icons.access_time,
                                            color: Color(0xFF4CB29A)),
                                        SizedBox(width: 8),
                                        Text(
                                          items[index].hora.toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
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

  Future<List<ShoppingDataModel>> _readJsonData() async {
    try {
      final jsondata =
          await rootBundle.rootBundle.loadString('data/shopping.json');
      final list = json.decode(jsondata) as List<dynamic>;
      return list.map((e) => ShoppingDataModel.fromJson(e)).toList();
    } catch (e) {
      print('Error al cargar datos desde el archivo JSON: $e');
      throw e;
    }
  }
}
