import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/DI/di.dart';
import 'package:news_app/core/widget/error_display_widget.dart';
import 'package:news_app/features/category_details/presentation/manager/category_cubit.dart';
import 'package:news_app/features/category_details/presentation/widgets/article_item.dart';
import 'package:news_app/features/category_details/presentation/widgets/Search/no_results_widget.dart';
import 'package:news_app/features/category_details/presentation/widgets/show_news_details.dart';

class SearchResultsWidget extends StatelessWidget {
  final CategoryCubit categoryCubit;
  const SearchResultsWidget({super.key, required this.categoryCubit});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: BlocBuilder<CategoryCubit, CategoryState>(
        bloc: categoryCubit,
        buildWhen: (previous, current) =>
            current is ArticlesLoadedSuccessState ||
            current is ArticlesErrorState ||
            current is ArticlesLoadingState,
        builder: (context, state) {
          if (state is ArticlesLoadedSuccessState) {
            final articles = state.articlesEntity.articles;
            if (articles == null || articles.isEmpty) {
              return const NoResultsWidget();
            }
            return ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return ShowNewsDetails(article: articles[index]);
                      },
                    );
                  },
                  child: ArticleItem(articleEntity: articles[index]),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              itemCount: articles.length,
            );
          } else if (state is ArticlesErrorState) {
            return ErrorDisplayWidget(errorMessage: state.error);
          } else {
            return Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.secondary),
            );
          }
        },
      ),
    );
  }
}
