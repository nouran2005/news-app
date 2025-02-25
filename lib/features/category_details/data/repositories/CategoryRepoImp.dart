import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/remote/InternetChecker.dart';
import 'package:news_app/features/category_details/data/data_source/CategoriesDao.dart';
import 'package:news_app/features/category_details/domain/entities/SourcesEntity/SourcesEntity.dart';
import 'package:news_app/features/category_details/domain/repositories/SourceRepo.dart';
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
}