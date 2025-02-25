import 'package:dartz/dartz.dart';
import 'package:news_app/features/category_details/data/models/SourceResponse/SourcesResponse.dart';

abstract class CategoriesDao {
  Future<Either<SourceResponse, String>> getSources({required String category, required String language});
}