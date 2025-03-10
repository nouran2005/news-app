import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/features/category_details/domain/entities/SourcesEntity/SourcesEntity.dart';
import 'package:news_app/features/category_details/domain/repositories/CategoryRepo.dart';
@injectable
class SourceUseCase{
  CategoryRepo repo;
  @factoryMethod
  SourceUseCase(this.repo);
  Future<Either<SourcesEntity, String>> call({required String category}) => repo.getSources(category: category);
} 