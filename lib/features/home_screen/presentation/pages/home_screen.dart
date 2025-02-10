import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget selectedWidget;
  String appBarTitle = "News App";
  bool searchIcon = false;
  //String? searchQuery;

  @override
  void initState() {
    super.initState();
    //SearchController = TextEditingController();
    //selectedWidget = CategoriesTab(onTap: selectNewCategory);
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
       // drawer: Drawer(child: CustomDrawer(onpress: onSelectedTab)),
        appBar: AppBar(
          title:  Text(appBarTitle),
          actions: searchIcon
              ? [
                  IconButton(
                    onPressed: (){
                      //showSearch(context: context, delegate: NewsSearch());
                    }, 
                    icon: Icon(Icons.search))
                ]
              : null,
        ),
        body: selectedWidget,
      ),
    );
  }
/*
  void onSelectedTab(Tabenum tab) {
    switch (tab) {
      case Tabenum.Categories:
        selectedWidget = CategoriesTab(onTap: selectNewCategory);
        appBarTitle = "News App";
        searchIcon = false;
        //isSearching = false;
        break;
      case Tabenum.Settings:
        selectedWidget = SetteingTab();
        appBarTitle = "Settings";
        searchIcon = false;
        //isSearching = false;
        break;
    }
    setState(() {});
    Navigator.pop(context);
  }

  void selectNewCategory(String ID, String categoryTitle) {
    selectedWidget = Categorydetailwidget(
      categoryID: ID,
    );
    appBarTitle = categoryTitle;
    searchIcon = true;
    //isSearching = false;
    setState(() {});
  }*/

}

/*
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = "home";

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}*/