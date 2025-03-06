List<Categories> categoryFromJson(List<dynamic> categoryJson) =>
    List<Categories>.from(categoryJson
        .map((categoryListJson) => Categories.fromJson(categoryListJson)));
class Categories {
  String? id;
  String? name;
  String? date;
  String? image;

  Categories({this.id, this.name, this.date, this.image});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    date = json['date'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['date'] = date;
    data['image'] = image;
    return data;
  }
}
