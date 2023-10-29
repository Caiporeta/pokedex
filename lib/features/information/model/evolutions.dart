class PokemonEvolutions {
  Chain? chain;
  int? id;

  PokemonEvolutions({this.chain, this.id});

  PokemonEvolutions.fromJson(Map<String, dynamic> json) {
    chain = json['chain'] != null ? Chain.fromJson(json['chain']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chain != null) {
      data['chain'] = chain!.toJson();
    }
    data['id'] = id;
    return data;
  }
}

class Chain {
  List<EvolvesTo>? evolvesTo;
  bool? isBaby;
  Trigger? species;

  Chain({this.evolvesTo, this.isBaby, this.species});

  Chain.fromJson(Map<String, dynamic> json) {
    if (json['evolves_to'] != null) {
      evolvesTo = <EvolvesTo>[];
      json['evolves_to'].forEach((v) {
        evolvesTo!.add(EvolvesTo.fromJson(v));
      });
    }
    isBaby = json['is_baby'];
    species =
    json['species'] != null ? Trigger.fromJson(json['species']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (evolvesTo != null) {
      data['evolves_to'] = evolvesTo!.map((v) => v.toJson()).toList();
    }
    data['is_baby'] = isBaby;
    if (species != null) {
      data['species'] = species!.toJson();
    }
    return data;
  }
}

class EvolvesTo {
  List<EvolvesTo>? evolvesTo;
  bool? isBaby;
  Trigger? species;

  EvolvesTo({ this.evolvesTo, this.isBaby, this.species});

  EvolvesTo.fromJson(Map<String, dynamic> json) {
    if (json['evolves_to'] != null) {
      evolvesTo = <EvolvesTo>[];
      json['evolves_to'].forEach((v) {
        evolvesTo!.add(EvolvesTo.fromJson(v));
      });
    }
    isBaby = json['is_baby'];
    species =
    json['species'] != null ? Trigger.fromJson(json['species']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (evolvesTo != null) {
      data['evolves_to'] = evolvesTo!.map((v) => v.toJson()).toList();
    }
    data['is_baby'] = isBaby;
    if (species != null) {
      data['species'] = species!.toJson();
    }
    return data;
  }
}


class Trigger {
  String? name;
  String? url;

  Trigger({this.name, this.url});

  Trigger.fromJson(Map<String, dynamic> json) {
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
