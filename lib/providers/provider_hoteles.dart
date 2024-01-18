class HotelesDataModel {
  int? id;
  String? name;
  String? estrellas;
  String? imageURL;
  String? ubicacion;
  String? habitacion;

  HotelesDataModel(
      {this.id,
      this.name,
      this.estrellas,
      this.imageURL,
      this.ubicacion,
      this.habitacion});

  HotelesDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    estrellas = json['estrellas'];
    imageURL = json['imageUrl'];
    ubicacion = json['ubicacion'];
    habitacion = json['habitacion'];
  }
}
