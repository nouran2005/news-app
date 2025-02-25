import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/features/category_details/domain/entities/SourcesEntity/SourcesEntity.dart';
import 'package:news_app/features/category_details/domain/use_cases/SourceUseCase.dart';

part 'category_state.dart';

/*
@injectable
class CategoryCubit extends Cubit<CategoryState> {
  @factoryMethod
  CategoryCubit(this.sourceUseCase) : super(CategoryInitial());

  SourceUseCase sourceUseCase;
  void getSources({required String category, required String language}) async {
    emit(CategoryLoadingState());
    var result = await sourceUseCase.call(category: category, language: language);
    result.fold(
      (SourcesEntity) => emit(CategoryLoadedSuccessState(SourcesEntity)),
      (error) => emit(CategoryErrorState(error)),
    );
  }
}*/


@injectable
class CategoryCubit extends Cubit<CategoryState> {
  final SourceUseCase sourceUseCase;

  @factoryMethod
  CategoryCubit(this.sourceUseCase) : super(CategoryInitial());

  void getSources({required String category, required String language}) async {
    emit(CategoryLoadingState());
    var result = await sourceUseCase.call(category: category, language: language);
    result.fold(
      (SourcesEntity sourcesEntity) {
      emit(CategoryLoadedSuccessState(sourcesEntity));
    },
    (error) {
      emit(CategoryErrorState(error));
    },
    );
  }
}
