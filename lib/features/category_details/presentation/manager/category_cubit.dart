import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/features/category_details/domain/entities/ArticlesEntity/ArticlesEntity.dart';
import 'package:news_app/features/category_details/domain/entities/SourcesEntity/SourcesEntity.dart';
import 'package:news_app/features/category_details/domain/use_cases/ArticleUseCase.dart';
import 'package:news_app/features/category_details/domain/use_cases/SourceUseCase.dart';

part 'category_state.dart';


@injectable
class CategoryCubit extends Cubit<CategoryState> {
  final SourceUseCase sourceUseCase;
  final ArticleUseCase articleUseCase;

  @factoryMethod
  CategoryCubit(this.sourceUseCase, this.articleUseCase) : super(CategoryInitial());

  void getSources({required String category, required String language}) async {
    emit(SourcesLoadingState());
    var result = await sourceUseCase.call(category: category, language: language);
    result.fold(
      (SourcesEntity sourcesEntity) {
      emit(SourcesLoadedSuccessState(sourcesEntity));
    },
    (error) {
      emit(SourcesErrorState(error));
    },
    );
  }
  void getArticles({required String sourceID, required String language}) async {
    emit(ArticlesLoadingState());
    var result = await articleUseCase.call(sourceID: sourceID, language: language);
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

