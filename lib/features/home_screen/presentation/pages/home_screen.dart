import 'package:flutter/material.dart';
import 'package:news_app/features/category_details/presentation/pages/CategoryDetailsWidget.dart';
import 'package:news_app/features/category_details/presentation/widgets/SearchNews.dart';
import 'package:news_app/features/home_screen/presentation/widgets/CatecoriesTab.dart';
import 'package:news_app/features/home_screen/presentation/widgets/CustomDrawer.dart';


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
  @override
   initState() {
      super.initState();
      selectedWidget =CategoriesTab(
        onTap: selectNewCategory,
      );
    }

  Widget build(BuildContext context) {
   

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          actions: [
            searchIcon
                ? IconButton(
                    onPressed: () {
                      showSearch(context: context, delegate: NewsSearch());
                    },
                    icon: Icon(Icons.search, color: Theme.of(context).colorScheme.secondary),
                  )
                : Container()
          ],
        ),
        drawer: Drawer(child: CustomDrawer(onPress: goToHome,)),
        body: selectedWidget,
      ),
    );
  }



  void selectNewCategory(String ID, String categoryTitle) {
    selectedWidget = CategoryDetailsWidget(
      categoryID: ID,
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


