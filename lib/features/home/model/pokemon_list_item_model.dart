class PokemonListItemModel {
  int? count;
  List<PokemonListItem>? results;

  PokemonListItemModel({this.count, this.results});

  PokemonListItemModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['results'] != null) {
      results = <PokemonListItem>[];
      json['results'].forEach((v) {
        results!.add(PokemonListItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PokemonListItem {
  String? name;
  String? url;

  PokemonListItem({this.name, this.url});

  PokemonListItem.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
