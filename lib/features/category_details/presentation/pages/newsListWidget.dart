import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/DI/di.dart';
import 'package:news_app/core/resources/AppColor.dart';
import 'package:news_app/core/widget/dots_loading_indicator.dart';
import 'package:news_app/core/widget/error_display_widget.dart';
import 'package:news_app/features/category_details/presentation/manager/category_cubit.dart';
import 'package:news_app/features/category_details/presentation/widgets/ArticleItem.dart';
import 'package:news_app/features/category_details/presentation/widgets/showNewsDetails.dart';

class NewsListWidget extends StatefulWidget {
  final String sourceID;
  const NewsListWidget({Key? key, required this.sourceID}) : super(key: key);

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  final CategoryCubit categoryCubit = getIt<CategoryCubit>();

  @override
  void initState() {
    super.initState();
    categoryCubit.getArticles(sourceID: widget.sourceID, language: "en");
    categoryCubit.onScroll(sourceID: widget.sourceID, language: "en");
  }

  @override
  void dispose() {
    categoryCubit.scrollController.removeListener(() {});
    categoryCubit.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => categoryCubit,
      child: BlocBuilder<CategoryCubit, CategoryState>(
        buildWhen: (previous, current) =>
            current is ArticlesLoadedSuccessState ||
            current is ArticlesErrorState ||
            current is ArticlesLoadingState,
        builder: (context, state) {
          if (state is ArticlesLoadedSuccessState) {
            final articles = state.articlesEntity.articles;
            if (articles == null || articles.isEmpty) {
            return _buildNoArticlesMessage();
            }
            return ListView.separated(
              controller: categoryCubit.scrollController,
              itemBuilder: (context, index) {
                return InkWell(
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
                  child: ArticleItem(articleEntity: state.articlesEntity.articles![index]),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: state.articlesEntity.articles?.length ?? 0,
            );
          } else if (state is ArticlesErrorState) {
            return ErrorDisplayWidget(errorMessage: state.error, onRetry: () {
              categoryCubit.getArticles(sourceID: widget.sourceID, language: "en");
            });
          } else {
            return const Center(child: DotsLoadingIndicator());
          }
        },
      ),
    );
  }
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
