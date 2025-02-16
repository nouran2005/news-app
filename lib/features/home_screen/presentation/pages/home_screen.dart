import 'package:flutter/material.dart';
import 'package:news_app/core/resources/Style/AppStyle.dart';
import 'package:news_app/features/category_details/presentation/pages/CategoryDetailsWidget.dart';
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
        color: AppStyle.lightTheme.primaryColor,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
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
    //searchIcon = true;
    //isSearching = false;
    setState(() {});
  }

  void goToHome() {
    selectedWidget = CategoriesTab(onTap: selectNewCategory);
    appBarTitle = "Today's News";
    setState(() {});
    Navigator.pop(context);
  }
}


