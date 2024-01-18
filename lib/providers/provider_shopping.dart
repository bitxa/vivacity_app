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
