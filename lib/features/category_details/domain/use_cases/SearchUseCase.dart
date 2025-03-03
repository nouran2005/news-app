import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/features/category_details/domain/entities/ArticlesEntity/ArticlesEntity.dart';
import 'package:news_app/features/category_details/domain/repositories/CategoryRepo.dart';
@injectable
class SearchUseCase {
  CategoryRepo repo;
  @factoryMethod
  SearchUseCase(this.repo);
  Future<Either<ArticlesEntity, String>> searchArticles({required String search}) => repo.searchArticles(search: search);
}