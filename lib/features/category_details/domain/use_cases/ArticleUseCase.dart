import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/features/category_details/domain/entities/ArticlesEntity/ArticlesEntity.dart';
import 'package:news_app/features/category_details/domain/repositories/CategoryRepo.dart';
@injectable
class ArticleUseCase {
  CategoryRepo repo;
  @factoryMethod
  ArticleUseCase(this.repo);
  Future<Either<ArticlesEntity, String>> call({required String sourceID, required String language, int? page}) => repo.getArticles(sourceID: sourceID, language: language, page: page);
}