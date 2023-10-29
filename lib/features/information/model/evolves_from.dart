class EvolvesFrom {
  String? name;
  String? url;

  EvolvesFrom({this.name, this.url});

  EvolvesFrom.fromJson(Map<String, dynamic> json) {
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
