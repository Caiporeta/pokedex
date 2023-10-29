class PokemonVariety {
  bool? isDefault;
  Pokemon? pokemon;

  PokemonVariety({this.isDefault, this.pokemon});

  PokemonVariety.fromJson(Map<String, dynamic> json) {
    isDefault = json['is_default'];
    pokemon =
        json['pokemon'] != null ? Pokemon.fromJson(json['pokemon']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_default'] = isDefault;
    if (pokemon != null) {
      data['pokemon'] = pokemon!.toJson();
    }
    return data;
  }
}

class Pokemon {
  String? name;
  String? url;

  Pokemon({this.name, this.url});

  Pokemon.fromJson(Map<String, dynamic> json) {
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
