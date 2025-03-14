part of 'category_cubit.dart';


sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class SourcesLoadingState extends CategoryState {}

final class SourcesLoadedSuccessState extends CategoryState {
  SourcesEntity sourcesEntity;
  SourcesLoadedSuccessState(this.sourcesEntity);
}

final class SourcesErrorState extends CategoryState {
  String error;
  SourcesErrorState(this.error);
}

final class ArticlesLoadingState extends CategoryState {}

final class ArticlesLoadedSuccessState extends CategoryState {
  ArticlesEntity articlesEntity;
  ArticlesLoadedSuccessState(this.articlesEntity);
}

final class ArticlesErrorState extends CategoryState {
  String error;
  ArticlesErrorState(this.error);
}

class ArticlesLoadingMoreState extends CategoryState {} 