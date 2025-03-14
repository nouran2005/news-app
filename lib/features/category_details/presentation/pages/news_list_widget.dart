import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/DI/di.dart';
import 'package:news_app/core/resources/AppColor.dart';
import 'package:news_app/core/widget/dots_loading_indicator.dart';
import 'package:news_app/core/widget/error_display_widget.dart';
import 'package:news_app/features/category_details/presentation/manager/category_cubit.dart';
import 'package:news_app/features/category_details/presentation/widgets/article_item.dart';
import 'package:news_app/features/category_details/presentation/widgets/show_news_details.dart';

class NewsListWidget extends StatefulWidget {
  final String sourceID;
  const NewsListWidget({super.key, required this.sourceID});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  final CategoryCubit categoryCubit = getIt<CategoryCubit>();

  @override
  void initState() {
    super.initState();
    categoryCubit.getArticles(sourceID: widget.sourceID);
    categoryCubit.onScroll(sourceID: widget.sourceID);
  }

  @override
  void dispose() {
    categoryCubit.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: categoryCubit,
      child: BlocBuilder<CategoryCubit, CategoryState>(
        buildWhen: (previous, current) =>
            current is ArticlesLoadedSuccessState ||
            current is ArticlesLoadingMoreState || 
            current is ArticlesErrorState ||
            current is ArticlesLoadingState,
        builder: (context, state) {
          if (state is ArticlesLoadedSuccessState || state is ArticlesLoadingMoreState) {
            final articles = categoryCubit.articlesEntityList;
            if (articles.isEmpty) {
              return _buildNoArticlesMessage();
            }
            return ListView.separated(
              controller: categoryCubit.scrollController,
              itemCount: articles.length + (categoryCubit.isLoadingMore ? 1 : 0), 
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                if (index < articles.length) {
                  return InkWell(
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
                } else {
                  return _buildLoadingIndicator();
                }
              },
            );
          } else if (state is ArticlesErrorState) {
            return ErrorDisplayWidget(
              errorMessage: state.error,
              onRetry: () {
                categoryCubit.getArticles(sourceID: widget.sourceID);
              },
            );
          } else {
            return const Center(child: DotsLoadingIndicator());
          }
        },
      ),
    );
  }
}

Widget _buildLoadingIndicator() {
  return const Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Center(child:  DotsLoadingIndicator()), 
  );
}

Widget _buildNoArticlesMessage() {
  return Center(
    child: Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.article, size: 80, color: ColorManager.lightGreyColor),
          SizedBox(height: 10),
          Text(
            "No news available for this source.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: ColorManager.lightGreyColor),
          ),
        ],
      ),
    ),
  );
}
