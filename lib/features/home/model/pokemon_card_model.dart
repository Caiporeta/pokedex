class PokemonCardModel {
  late int id;
  late String url;
  late String name;
  late String image;

  PokemonCardModel(
      {required this.id,
      required this.url,
      required this.name,
      required this.image});

  PokemonCardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}
