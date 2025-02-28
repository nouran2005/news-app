import 'SourceEntity.dart';

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


  String? status;
  String? code;
  String? message;
  List<SourceEntity>? sources;


}
