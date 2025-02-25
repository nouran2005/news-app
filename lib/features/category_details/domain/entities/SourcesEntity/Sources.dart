/// id : "bbc-sport"
/// name : "BBC Sport"

class Sources {
  Sources({
    this.id,
    this.name,
  });

  Sources.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  String? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
