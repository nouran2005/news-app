import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/features/category_details/domain/entities/ArticlesEntity/ArticleEntity.dart';
import 'package:news_app/features/category_details/domain/entities/ArticlesEntity/ArticlesEntity.dart';
import 'package:news_app/features/category_details/domain/entities/SourcesEntity/SourcesEntity.dart';
import 'package:news_app/features/category_details/domain/use_cases/ArticleUseCase.dart';
import 'package:news_app/features/category_details/domain/use_cases/SearchUseCase.dart';
import 'package:news_app/features/category_details/domain/use_cases/SourceUseCase.dart';

part 'category_state.dart';

@injectable
class CategoryCubit extends Cubit<CategoryState> {
  final SourceUseCase sourceUseCase;
  final ArticleUseCase articleUseCase;
  final SearchUseCase searchUseCase;

  int page = 1;
  bool isLoadingMore = false; 
  ScrollController scrollController = ScrollController();
  List<ArticleEntity> articlesEntityList = [];

  @factoryMethod
  CategoryCubit(this.sourceUseCase, this.articleUseCase, this.searchUseCase)
      : super(CategoryInitial());

  void getSources({required String category}) async {
    emit(SourcesLoadingState());
    var result = await sourceUseCase.call(category: category);
    result.fold(
      (SourcesEntity sourcesEntity) {
        emit(SourcesLoadedSuccessState(sourcesEntity));
      },
      (error) {
        emit(SourcesErrorState(error));
      },
    );
  }

 void getArticles({required String sourceID}) async {
  if (articlesEntityList.isEmpty) {
    emit(ArticlesLoadingState());
  } else {
    if (!isLoadingMore) {
      isLoadingMore = true;
      emit(ArticlesLoadingMoreState());  
    }
  }

  var result = await articleUseCase.call(sourceID: sourceID, page: page);
  result.fold(
    (ArticlesEntity articlesEntity) {
      if (articlesEntity.articles != null) {
        articlesEntityList.addAll(articlesEntity.articles!);
      }
      isLoadingMore = false;  
      emit(ArticlesLoadedSuccessState(ArticlesEntity(articles: articlesEntityList)));
    },
    (error) {
      isLoadingMore = false;
      emit(ArticlesErrorState(error));
    },
  );
}

  void onScroll({required String sourceID}) {
    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 100) {
        if (!isLoadingMore) {  
          page++;
          getArticles(sourceID: sourceID);
        }
      }
    });
  }

  void searchArticles({required String search}) async {
    emit(ArticlesLoadingState());
    var result = await searchUseCase.searchArticles(search: search);
    result.fold(
      (ArticlesEntity articlesEntity) {
        emit(ArticlesLoadedSuccessState(articlesEntity));
      },
      (error) {
        emit(ArticlesErrorState(error));
      },
    );
  }
}
