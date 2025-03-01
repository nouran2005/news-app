import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/remote/InternetChecker.dart';
import 'package:news_app/features/category_details/data/data_source/CategoriesDao.dart';
import 'package:news_app/features/category_details/domain/entities/ArticlesEntity/ArticlesEntity.dart';
import 'package:news_app/features/category_details/domain/entities/SourcesEntity/SourcesEntity.dart';
import 'package:news_app/features/category_details/domain/repositories/CategoryRepo.dart';
@Injectable(as: CategoryRepo)
class CategoryRepoImp extends CategoryRepo {
  CategoriesDao categoriesDao;
  @factoryMethod
  CategoryRepoImp(this.categoriesDao);
  @override
  Future<Either<SourcesEntity, String>> getSources({required String category, required String language})async {
  bool isConnected = await InternetChecker.CheckNetwork();
   if(isConnected){
    var result = await categoriesDao.getSources(category: category, language: language);
    return result.fold(
      (response){
        return Left(response.toSourcesEntity());
      },(error){
        return Right(error);
      });
    }else{
      return Right("No Internet Connection");
    }
  }

  @override
  Future<Either<ArticlesEntity, String>> getArticles({required String sourceID, required String language, int? page})async {
    bool isConnected =await InternetChecker.CheckNetwork();
    if(isConnected){
      var result =await categoriesDao.getArticles(sourceID: sourceID, language: language, page: page);
      return result.fold(
        (response){
          return Left(response.toArticlesEntity());
        },(error){
          return Right(error);
        });
    }else{
      return Right("No Internet Connection");
    }
  }
  
}