class HotelesDataModel {
  int? id;
  String? name;
  String? estrellas;
  String? imageURL;

  HotelesDataModel({
    this.id,
    this.name,
    this.estrellas,
    this.imageURL,
  });

  HotelesDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    estrellas = json['estrellas'];
    imageURL = json['imageUrl'];
  }
}
