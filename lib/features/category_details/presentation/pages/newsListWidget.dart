import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/DI/di.dart';
import 'package:news_app/features/category_details/data/models/ArticleModel.dart';
import 'package:news_app/features/category_details/presentation/manager/category_cubit.dart';
import 'package:news_app/features/category_details/presentation/widgets/ArticleItem.dart';

class NewsListWidget extends StatefulWidget {
  final String sourceID;
  const NewsListWidget({
    Key? key,
    required this.sourceID,
  }) : super(key: key);

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  CategoryCubit categoryCubit = getIt<CategoryCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryCubit.getArticles(sourceID: widget.sourceID, language: "en");
    categoryCubit.onScroll(sourceID: widget.sourceID, language: "en");
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    categoryCubit.scrollController.removeListener((){});
    categoryCubit.scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return categoryCubit;
        
      },
      
      child: BlocBuilder<CategoryCubit, CategoryState>(
         buildWhen: (previous, current) {
          if (current is ArticlesLoadedSuccessState ||
              current is ArticlesErrorState ||
              current is ArticlesLoadingState) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if (state is ArticlesLoadedSuccessState) {
            return ListView.separated(
              controller: categoryCubit.scrollController,
              itemBuilder: (context, index) => ArticleItem(articleEntity: state.articlesEntity.articles![index],) , 
              separatorBuilder:(context, index) =>  SizedBox() , 
              itemCount: state.articlesEntity.articles?.length??0,
            );
          } else if (state is ArticlesErrorState) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },

      )
      );
    /*ListView.separated(
      itemBuilder:(context, index) => ArticleItem(articleModel: AllArticls[index],) , 
      separatorBuilder:(context, index) =>  SizedBox() , 
      itemCount:AllArticls.length);
    */
  }
}

List<ArticleModel> AllArticls =[
    ArticleModel(
      image: "https://media.istockphoto.com/id/471296532/photo/planet-earth-at-night.jpg?s=612x612&w=0&k=20&c=n-9GMF-nYTuZJ5z6oc7sCo8MagfPlx2JeK-4visym_E=",
      title: "The best way to learn Flutter 2022 - Mastering Flutter 2.5 with Riverpod and Freezed",
      auther: "John Doe",
      date: DateTime.now(),
    ),
    ArticleModel(
      image: "https://m.istockphoto.com/id/471296532/photo/planet-earth-at-night.jpg?s=612x612&w=0&k=20&c=n-9GMF-nYTuZJ5z6oc7sCo8MagfPlx2JeK-4visym_E=",
      title: "The best way to learn Flutter 2022 - Mastering Flutter 2.5 with Riverpod and Freezed",
      auther: "John Doe",
      date: DateTime.now(),
    ),
    ArticleModel(
      image: "https://media.istockphoto.com/id/471296532/photo/planet-earth-at-night.jpg?s=612x612&w=0&k=20&c=n-9GMF-nYTuZJ5z6oc7sCo8MagfPlx2JeK-4visym_E=",
      title: "The best way to learn Flutter 2022 - Mastering Flutter 2.5 with Riverpod and Freezed",
      auther: "John Doe",
      date: DateTime.now(),
    ),
    ArticleModel(
      image: "https://media.istockphoto.com/id/471296532/photo/planet-earth-at-night.jpg?s=612x612&w=0&k=20&c=n-9GMF-nYTuZJ5z6oc7sCo8MagfPlx2JeK-4visym_E=",
      title: "The best way to learn Flutter 2022 - Mastering Flutter 2.5 with Riverpod and Freezed",
      auther: "John Doe",
      date: DateTime.now(),
    ),
    ArticleModel(
      image: "https://media.istockphoto.com/id/471296532/photo/planet-earth-at-night.jpg?s=612x612&w=0&k=20&c=n-9GMF-nYTuZJ5z6oc7sCo8MagfPlx2JeK-4visym_E=",
      title: "The best way to learn Flutter 2022 - Mastering Flutter 2.5 with Riverpod and Freezed",
      auther: "John Doe",
      date: DateTime.now(),
    ),
  ];

