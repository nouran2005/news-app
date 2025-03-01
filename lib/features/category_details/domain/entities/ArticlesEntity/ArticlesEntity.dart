import 'ArticleEntity.dart';

/// status : "ok"
/// totalResults : 1270
/// code : "apiKeyInvalid"
/// message : "Your API key is invalid or incorrect. Check your key, or go to https://newsapi.org to create a free API key."
/// articles : [{"source":{"id":"bbc-news","name":"BBC News"},"author":null,"title":"25/02/2025 18:01 GMT","description":"The latest five minute news bulletin from BBC World Service.","url":"https://www.bbc.co.uk/programmes/w172zgfm0cw42tt","urlToImage":"https://ichef.bbci.co.uk/images/ic/1200x675/p060dh18.jpg","publishedAt":"2025-02-25T18:06:00Z"},null]

class ArticlesEntity {
  ArticlesEntity({
    this.status,
    this.totalResults,
    this.code,
    this.message,
    this.articles,
  });

  
  String? status;
  num? totalResults;
  String? code;
  String? message;
  List<ArticleEntity>? articles;

  
}
