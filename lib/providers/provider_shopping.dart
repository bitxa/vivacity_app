class ShoppingDataModel {
  int? id;
  String? name;
  String? hora;
  String? imageURL;
  String? ubicacion;
  String? camisetas;
  String? pantalones;
  String? zapatos;
  String? collares;

  ShoppingDataModel(
      {this.id,
      this.name,
      this.hora,
      this.imageURL,
      this.ubicacion,
      this.camisetas,
      this.pantalones,
      this.zapatos,
      this.collares});

  ShoppingDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    hora = json['hora'];
    imageURL = json['imageUrl'];
    ubicacion = json['ubicacion'];
    camisetas = json['camisetas'];
    pantalones = json['pantalones'];
    zapatos = json['zapatos'];
    collares = json['collares'];
  }
}
