import 'package:dartz/dartz.dart';
import 'package:news_app/features/category_details/domain/entities/ArticlesEntity/ArticlesEntity.dart';
import 'package:news_app/features/category_details/domain/entities/SourcesEntity/SourcesEntity.dart';

abstract class CategoryRepo{
  Future<Either<SourcesEntity, String>> getSources({required String category});
  Future<Either<ArticlesEntity, String>> getArticles({required String sourceID, int? page});
  Future<Either<ArticlesEntity, String>> searchArticles({required String search});
}