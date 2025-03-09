import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/widget/error_display_widget.dart';
import 'package:news_app/features/category_details/presentation/manager/category_cubit.dart';
import 'package:news_app/features/category_details/presentation/widgets/ArticleItem.dart';
import 'package:news_app/features/category_details/presentation/widgets/showNewsDetails.dart';

class NewsSearch extends SearchDelegate {
  String previousQuery = ""; 

  @override
  @override
ThemeData appBarTheme(BuildContext context) {
  final theme = Theme.of(context);
  return theme.copyWith(
    appBarTheme: theme.appBarTheme.copyWith(
      backgroundColor: theme.colorScheme.primary, 
      iconTheme: IconThemeData(color: theme.colorScheme.secondary),
      actionsIconTheme: IconThemeData(color: theme.colorScheme.secondary), 
      titleTextStyle: theme.textTheme.titleLarge?.copyWith(
        color: theme.colorScheme.secondary, 
        fontSize: 20.sp,
      ),
      elevation: 0,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: theme.colorScheme.secondary, 
    ),
    inputDecorationTheme: theme.inputDecorationTheme.copyWith(
      filled: true,
      fillColor: theme.colorScheme.primary, 
      hintStyle: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.secondary,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(1.r),
        borderSide: BorderSide.none, 
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h), 
    ),
    textTheme: theme.textTheme.copyWith(
      titleLarge: theme.textTheme.titleLarge?.copyWith(
        color: theme.colorScheme.secondary,
        fontSize: 20.sp,
      ),
    ),
  );
}


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
          previousQuery = "";
        },
        icon: Icon(Icons.close, color: Theme.of(context).colorScheme.error),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.secondary),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _buildSearchPrompt(context);
    }
    if (query != previousQuery) {
      previousQuery = query;
      context.read<CategoryCubit>().searchArticles(search: query);
    }
    return _buildSearchResults(context);
  }

  Widget _buildSearchPrompt(BuildContext context) {
    return Container(
      decoration: _backgroundDecoration(context),
      child: Center(
        child: Text(
          "Search for articles...",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResults(BuildContext context) {
    return Container(
      decoration: _backgroundDecoration(context),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        buildWhen: (previous, current) =>
            current is ArticlesLoadedSuccessState ||
            current is ArticlesErrorState ||
            current is ArticlesLoadingState,
        builder: (context, state) {
          if (state is ArticlesLoadedSuccessState) {
            final articles = state.articlesEntity.articles;
            if (articles == null || articles.isEmpty) {
              return _buildNoResultsFound();
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
              child: CircularProgressIndicator(color: Theme.of(context).colorScheme.secondary),
            );
          }
        },
      ),
    );
  }

  Widget _buildNoResultsFound() {
    return Center(
      child: Text(
        "No articles found.",
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: Colors.redAccent,
        ),
      ),
    );
  }

  BoxDecoration _backgroundDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
