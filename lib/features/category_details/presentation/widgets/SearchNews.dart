import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/AppColor.dart';
import 'package:news_app/core/widget/error_display_widget.dart';
import 'package:news_app/features/category_details/presentation/manager/category_cubit.dart';
import 'package:news_app/features/category_details/presentation/widgets/ArticleItem.dart';
import 'package:news_app/features/category_details/presentation/widgets/showNewsDetails.dart';

class NewsSearch extends SearchDelegate {
  String previousQuery = ""; 

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorManager.lightPrimaryColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: ColorManager.lightSecondaryColor,
          size: 27.sp,
        ),
        titleTextStyle: TextStyle(
          color: ColorManager.lightSecondaryColor,
          fontSize: 25.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "Great Vibes",
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 92, 7, 219),
        primary: ColorManager.lightPrimaryColor,
        secondary: ColorManager.lightSecondaryColor,
        onPrimary: ColorManager.greyColor,
      ),
      textTheme: TextTheme(
        headlineMedium: TextStyle(
          fontSize: 35.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "Great Vibes",
          color: ColorManager.lightSecondaryColor,
        ),
        headlineSmall: TextStyle(
          color: ColorManager.lightPrimaryColor,
          fontSize: 28.sp,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Inter",
          color: ColorManager.lightSecondaryColor,
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
        icon: Icon(Icons.close, color: const Color.fromARGB(169, 162, 0, 0)),
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
            color: Colors.blueGrey,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResults(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: BlocBuilder<CategoryCubit, CategoryState>(
        buildWhen: (previous, current) {
          return current is ArticlesLoadedSuccessState ||
              current is ArticlesErrorState ||
              current is ArticlesLoadingState;
        },
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
                        return ShowNewsDetails(article: state.articlesEntity.articles![index]);
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

