import 'package:news_app/features/category_details/data/models/SourceResponse/Source.dart';
import 'package:news_app/features/category_details/domain/entities/ArticlesEntity/ArticleEntity.dart';


/// source : {"id":"bbc-news","name":"BBC News"}
/// author : null
/// title : "25/02/2025 18:01 GMT"
/// description : "The latest five minute news bulletin from BBC World Service."
/// url : "https://www.bbc.co.uk/programmes/w172zgfm0cw42tt"
/// urlToImage : "https://ichef.bbci.co.uk/images/ic/1200x675/p060dh18.jpg"
/// publishedAt : "2025-02-25T18:06:00Z"
/// content : "The latest five minute news bulletin from BBC World Service."

class Article {
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Article.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  dynamic author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

  ArticleEntity toArticleEntity() {
    return ArticleEntity(
      source: source,
      author: author,
      title: title, 
      description: description, 
      url: url, 
      urlToImage: urlToImage, 
      publishedAt: publishedAt, 
      );
  }
}
