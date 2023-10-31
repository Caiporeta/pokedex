class PokemonDetailsModel {
  int? baseExperience;
  Species? species;
  int? height;
  int? id;
  bool? isDefault;
  String? name;
  int? order;
  Sprites? sprites;

  PokemonDetailsModel(
      {this.baseExperience,
      this.species,
      this.height,
      this.id,
      this.isDefault,
      this.name,
      this.order,
      this.sprites});

  PokemonDetailsModel.fromJson(Map<String, dynamic> json) {
    baseExperience = json['base_experience'];
    species =
        json['species'] != null ? Species.fromJson(json['species']) : null;
    height = json['height'];
    id = json['id'];
    isDefault = json['is_default'];
    name = json['name'];
    order = json['order'];
    sprites =
        json['sprites'] != null ? Sprites.fromJson(json['sprites']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_experience'] = baseExperience;
    if (species != null) {
      data['species'] = species!.toJson();
    }
    data['height'] = height;
    data['id'] = id;
    data['is_default'] = isDefault;
    data['name'] = name;
    data['order'] = order;
    if (sprites != null) {
      data['sprites'] = sprites!.toJson();
    }
    return data;
  }
}

class Species {
  String? name;
  String? url;

  Species({this.name, this.url});

  Species.fromJson(Map<String, dynamic> json) {
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

class Sprites {
  Other? other;

  Sprites({this.other});

  Sprites.fromJson(Map<String, dynamic> json) {
    other = json['other'] != null ? Other.fromJson(json['other']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (other != null) {
      data['other'] = other!.toJson();
    }
    return data;
  }
}

class Other {
  DreamWorld? dreamWorld;

  Other({this.dreamWorld});

  Other.fromJson(Map<String, dynamic> json) {
    dreamWorld = json['dream_world'] != null
        ? DreamWorld.fromJson(json['dream_world'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dreamWorld != null) {
      data['dream_world'] = dreamWorld!.toJson();
    }
    return data;
  }
}

class DreamWorld {
  String? frontDefault;

  DreamWorld({this.frontDefault});

  DreamWorld.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['front_default'] = frontDefault;
    return data;
  }
}
