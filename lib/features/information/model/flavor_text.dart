class FlavorText {
  String? flavorText;
  Language? language;
  Language? version;

  FlavorText({this.flavorText, this.language, this.version});

  FlavorText.fromJson(Map<String, dynamic> json) {
    flavorText = json['flavor_text'];
    language =
        json['language'] != null ? Language.fromJson(json['language']) : null;
    version =
        json['version'] != null ? Language.fromJson(json['version']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flavor_text'] = flavorText;
    if (language != null) {
      data['language'] = language!.toJson();
    }
    if (version != null) {
      data['version'] = version!.toJson();
    }
    return data;
  }
}

class Language {
  String? name;
  String? url;

  Language({this.name, this.url});

  Language.fromJson(Map<String, dynamic> json) {
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
