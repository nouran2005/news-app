// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:news_app/features/category_details/data/repositories/CategoryRepoImp.dart';

import '../../features/category_details/data/data_source/CategoriesDao.dart'
    as _i172;
import '../../features/category_details/data/data_source/data_category_imp/CategoriesDaoApiImp.dart'
    as _i256;
import '../../features/category_details/domain/repositories/CategoryRepo.dart'
    as _i685;
import '../../features/category_details/domain/use_cases/ArticleUseCase.dart'
    as _i814;
import '../../features/category_details/domain/use_cases/SourceUseCase.dart'
    as _i661;
import '../../features/category_details/presentation/manager/category_cubit.dart'
    as _i377;
import '../remote/ApiManager.dart' as _i931;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i931.ApiManager>(() => _i931.ApiManager());
    gh.factory<_i172.CategoriesDao>(
        () => _i256.CategoriesDaoApiImp(gh<_i931.ApiManager>()));
    gh.factory<_i661.SourceUseCase>(
                () => _i661.SourceUseCase(gh<_i685.CategoryRepo>()));
    gh.factory<_i685.CategoryRepo>(
        () => CategoryRepoImp(gh<_i172.CategoriesDao>()));
    gh.factory<_i814.ArticleUseCase>(
        () => _i814.ArticleUseCase(gh<_i685.CategoryRepo>()));
    gh.factory<_i377.CategoryCubit>(() => _i377.CategoryCubit(
          gh<_i661.SourceUseCase>(),
          gh<_i814.ArticleUseCase>(),
        ));
    return this;
  }
}
