import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/remote/ApiManager.dart';
import 'package:news_app/core/remote/endpoints.dart';
import 'package:news_app/core/resources/constants_manager.dart';
import 'package:news_app/features/category_details/data/data_source/CategoriesDao.dart';
import 'package:news_app/features/category_details/data/models/ArticleResponse/ArticlesResponse.dart';
import 'package:news_app/features/category_details/data/models/SourceResponse/SourcesResponse.dart';

@Injectable(as: CategoriesDao)
class CategoriesDaoApiImp extends CategoriesDao {
  ApiManager apiManager;
  @factoryMethod
  CategoriesDaoApiImp(this.apiManager);
  @override
  Future<Either<SourceResponse, String>> getSources(
      {required String category, required String language}) async {
    try {
      var response = await apiManager.get(url: Endpoints.Sources, query: {
        "category": category,
        "language": language,
        "apiKey": AppConestants.apiKey
      });
      var sourceResponse = SourceResponse.fromJson(response.data);
      if (response.statusMessage == null ||
          response.statusMessage!.toLowerCase() == "ok") {
        return Left(sourceResponse);
      } else {
        return Right(response.statusMessage!);
      }
    } catch (e) {
      return Right(e.toString());
    }
  }

  @override
  Future<Either<ArticlesResponse, String>> getArticles(
      {required String sourceID, required String language, int? page}) async {
    try {
      var response = await apiManager.get(url: Endpoints.Articles, query: {
        "sources": sourceID,
        "language": language,
        "apiKey": AppConestants.apiKey,
        "pageSize": "10",
        "page": "$page"
      });
      var articlesResponse = ArticlesResponse.fromJson(response.data);
      if (response.statusMessage == null ||
          response.statusMessage!.toLowerCase() == "ok") {
        return Left(articlesResponse);
      } else {
        return Right(response.statusMessage!);
      }
    } catch (e) {
      return Right(e.toString());
    }
  }
  
  @override
  Future<Either<ArticlesResponse, String>> searchArticles({required String search}) async{
    try {
      var response = await apiManager.get(url: Endpoints.Articles, query: {
        "q": search,
        "apiKey": AppConestants.apiKey,
      });
      var articlesResponse = ArticlesResponse.fromJson(response.data);
      if (response.statusMessage == null ||
          response.statusMessage!.toLowerCase() == "ok") {
        return Left(articlesResponse);
      } else {
        return Right(response.statusMessage!);

      }
    } catch (e) {
      return Right(e.toString());
    }
  }
  
}
