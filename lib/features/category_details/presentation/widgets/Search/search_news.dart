import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/category_details/presentation/manager/category_cubit.dart';
import 'package:news_app/features/category_details/presentation/widgets/Search/search_prompt_widget.dart';
import 'package:news_app/features/category_details/presentation/widgets/Search/search_results_widget.dart';

class NewsSearch extends SearchDelegate {
  String previousQuery = "";
  Timer? _debounce;

  final CategoryCubit viewModel;

  NewsSearch({required this.viewModel});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
          previousQuery = "";
          _debounce?.cancel();
        },
        icon: Icon(Icons.close, color: Theme.of(context).colorScheme.error),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: Icon(Icons.arrow_back,
          color: Theme.of(context).colorScheme.secondary),
    );
  }

  @override
  Widget buildResults(BuildContext context) => _buildSearchResults(context);

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) return SearchPromptWidget();
    if (query != previousQuery) {
      previousQuery = query;
      _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 300), () {
        viewModel.searchArticles(search: query);
      });
    }
    return _buildSearchResults(context);
  }

  Widget _buildSearchResults(BuildContext context) {
    return SearchResultsWidget(categoryCubit: viewModel);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

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
}
