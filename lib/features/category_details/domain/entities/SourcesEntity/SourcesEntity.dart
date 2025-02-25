import 'Sources.dart';

/// status : "ok"
/// code : "apiKeyInvalid"
/// message : "Your API key is invalid or incorrect. Check your key, or go to https://newsapi.org to create a free API key."
/// sources : [{"id":"bbc-sport","name":"BBC Sport"}]

class SourcesEntity {
  SourcesEntity({
    this.status,
    this.code,
    this.message,
    this.sources,
  });

  SourcesEntity.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Sources.fromJson(v));
      });
    }
  }
  String? status;
  String? code;
  String? message;
  List<Sources>? sources;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['code'] = code;
    map['message'] = message;
    if (sources != null) {
      map['sources'] = sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
