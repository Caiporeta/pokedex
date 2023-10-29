class MoveData {
  int? accuracy;
  DamageClass? damageClass;
  List<EffectEntries>? effectEntries;
  List<FlavorTextEntries>? flavorTextEntries;
  int? id;
  String? name;
  int? power;
  DamageClass? type;

  MoveData(
      {this.accuracy,
      this.damageClass,
      this.effectEntries,
      this.flavorTextEntries,
      this.id,
      this.name,
      this.power,
      this.type});

  MoveData.fromJson(Map<String, dynamic> json) {
    accuracy = json['accuracy'];
    damageClass = json['damage_class'] != null
        ? DamageClass.fromJson(json['damage_class'])
        : null;
    if (json['effect_entries'] != null) {
      effectEntries = <EffectEntries>[];
      json['effect_entries'].forEach((v) {
        effectEntries!.add(EffectEntries.fromJson(v));
      });
    }
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries = <FlavorTextEntries>[];
      json['flavor_text_entries'].forEach((v) {
        flavorTextEntries!.add(FlavorTextEntries.fromJson(v));
      });
    }
    id = json['id'];
    name = json['name'];
    power = json['power'];
    type = json['type'] != null ? DamageClass.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accuracy'] = accuracy;
    if (damageClass != null) {
      data['damage_class'] = damageClass!.toJson();
    }
    if (effectEntries != null) {
      data['effect_entries'] = effectEntries!.map((v) => v.toJson()).toList();
    }
    if (flavorTextEntries != null) {
      data['flavor_text_entries'] =
          flavorTextEntries!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['name'] = name;
    data['power'] = power;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    return data;
  }
}

class DamageClass {
  String? name;
  String? url;

  DamageClass({this.name, this.url});

  DamageClass.fromJson(Map<String, dynamic> json) {
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

class EffectEntries {
  String? effect;
  DamageClass? language;
  String? shortEffect;

  EffectEntries({this.effect, this.language, this.shortEffect});

  EffectEntries.fromJson(Map<String, dynamic> json) {
    effect = json['effect'];
    language = json['language'] != null
        ? DamageClass.fromJson(json['language'])
        : null;
    shortEffect = json['short_effect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['effect'] = effect;
    if (language != null) {
      data['language'] = language!.toJson();
    }
    data['short_effect'] = shortEffect;
    return data;
  }
}

class FlavorTextEntries {
  String? flavorText;
  DamageClass? language;

  FlavorTextEntries({this.flavorText, this.language});

  FlavorTextEntries.fromJson(Map<String, dynamic> json) {
    flavorText = json['flavor_text'];
    language = json['language'] != null
        ? DamageClass.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flavor_text'] = flavorText;
    if (language != null) {
      data['language'] = language!.toJson();
    }
    return data;
  }
}
