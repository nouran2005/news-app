import 'package:news_app/features/category_details/data/models/SourceResponse/Source.dart';



/// source : {"id":"bbc-news","name":"BBC News"}
/// author : null
/// title : "25/02/2025 18:01 GMT"
/// description : "The latest five minute news bulletin from BBC World Service."
/// url : "https://www.bbc.co.uk/programmes/w172zgfm0cw42tt"
/// urlToImage : "https://ichef.bbci.co.uk/images/ic/1200x675/p060dh18.jpg"
/// publishedAt : "2025-02-25T18:06:00Z"

class ArticleEntity {
  ArticleEntity({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
  });

 
  Source? source;
  dynamic author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;

}
