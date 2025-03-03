import 'package:dartz/dartz.dart';
import 'package:news_app/features/category_details/data/models/ArticleResponse/ArticlesResponse.dart';
import 'package:news_app/features/category_details/data/models/SourceResponse/SourcesResponse.dart';

abstract class CategoriesDao {
  Future<Either<SourceResponse, String>> getSources({required String category, required String language});
  Future<Either<ArticlesResponse, String>> getArticles({required String sourceID, required String language, int? page});
  Future<Either<ArticlesResponse, String>> searchArticles({required String search});
}