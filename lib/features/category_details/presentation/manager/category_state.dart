part of 'category_cubit.dart';


sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoadingState extends CategoryState {}

final class CategoryLoadedSuccessState extends CategoryState {
  SourcesEntity sourcesEntity;
  CategoryLoadedSuccessState(this.sourcesEntity);
}

final class CategoryErrorState extends CategoryState {
  String error;
  CategoryErrorState(this.error);
}