import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/DI/di.dart';
import 'package:news_app/features/category_details/presentation/pages/category_details_widget.dart';
import 'package:news_app/features/category_details/presentation/widgets/Search/search_news.dart';
import 'package:news_app/features/home_screen/presentation/widgets/catecories_tab.dart';
import 'package:news_app/features/home_screen/presentation/widgets/custom_drawer.dart';

import '../../../category_details/presentation/manager/category_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget selectedWidget;
  String appBarTitle = "Today's News";
  bool searchIcon = false;

  late CategoryCubit viewModel;

  @override
  initState() {
    super.initState();
    viewModel = getIt.get<CategoryCubit>();
    selectedWidget = CategoriesTab(
      onTap: selectNewCategory,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryCubit>(
      create: (context) => viewModel,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          title: Text(appBarTitle),
          actions: [
            searchIcon
                ? IconButton(
                    onPressed: () {
                      showSearch(
                          context: context,
                          delegate: NewsSearch(viewModel: viewModel));
                    },
                    icon: Icon(Icons.search,
                        color: Theme.of(context).colorScheme.secondary),
                  )
                : Container()
          ],
        ),
        drawer: Drawer(
            child: CustomDrawer(
          onPress: goToHome,
        )),
        body: selectedWidget,
      ),
    );
  }

  void selectNewCategory(String id, String categoryTitle) {
    selectedWidget = CategoryDetailsWidget(
      categoryID: id,
    );
    appBarTitle = categoryTitle;
    searchIcon = true;
    setState(() {});
  }

  void goToHome() {
    selectedWidget = CategoriesTab(onTap: selectNewCategory);
    appBarTitle = "Today's News";
    searchIcon = false;
    setState(() {});
    Navigator.pop(context);
  }
}
