import 'package:dartz/dartz.dart';
import 'package:news_app/features/category_details/domain/entities/SourcesEntity/SourcesEntity.dart';

abstract class CategoryRepo{
  Future<Either<SourcesEntity, String>> getSources({required String category, required String language});
}