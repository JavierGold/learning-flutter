class AnimalModel {
  String? id;
  String? name;
  String? img;
  bool? favourite;
  String? type;

  AnimalModel({this.id, this.name, this.img, this.favourite, this.type});

  factory AnimalModel.fromJson(Map<String, dynamic> json) => AnimalModel(
      id: json['_id'],
      name: json['name'],
      img: json['img'],
      favourite: json['favourite'],
      type: json['type']);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "img": img,
        "favourite": favourite,
        "type": type,
      };
}
