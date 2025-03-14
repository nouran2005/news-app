import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/DI/di.dart';
import 'package:news_app/core/widget/dots_loading_indicator.dart';
import 'package:news_app/core/widget/error_display_widget.dart';
import 'package:news_app/features/category_details/presentation/manager/category_cubit.dart';
import 'package:news_app/features/category_details/presentation/pages/news_list_widget.dart';

class CategoryDetailsWidget extends StatelessWidget {
  const CategoryDetailsWidget({
    Key? key,
    required this.categoryID,
  }) : super(key: key);

  final String categoryID;
  /*static const List<String> sources = [
    "ABC News",
    "Aftenposten",
    "ANSA.it",
    "Ary News",
    "Axios"
  ];*/

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return getIt<CategoryCubit>()..getSources(category: categoryID);
      },
      child: BlocBuilder<CategoryCubit, CategoryState>(
        buildWhen: (previous, current) {
          if (current is SourcesLoadedSuccessState ||
              current is SourcesErrorState ||
              current is SourcesLoadingState) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if (state is SourcesLoadedSuccessState) {
            return DefaultTabController(
              length: state.sourcesEntity.sources?.length??0,
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    dividerHeight: 0,
                    indicatorPadding: EdgeInsets.zero,
                    labelColor: Theme.of(context).colorScheme.secondary,
                    unselectedLabelStyle: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.secondary),
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                          width: 2.5.w,
                          color: Theme.of(context).colorScheme.secondary),
                      insets: REdgeInsets.symmetric(horizontal: 2),
                    ),
                    labelPadding: REdgeInsets.only(left: 0, right: 20),
                    tabs: state.sourcesEntity.sources!
                    .map<Widget>((source) => Container(
                            child: Tab(child: Text(source.name ?? "")),
                              )).toList() ,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Expanded(
                    child: TabBarView(
                        children:
                            state.sourcesEntity.sources!.map((source) => NewsListWidget(sourceID: source.id ?? '',)).toList()),
                  ),
                ],
              ),
            );
          }
          if (state is SourcesErrorState) {
            return ErrorDisplayWidget(errorMessage: state.error, onRetry: () {
              context.read<CategoryCubit>().getSources(category: categoryID);
            });
          }
          return Center(child:DotsLoadingIndicator());
        },
      ),
    );
  }
}
