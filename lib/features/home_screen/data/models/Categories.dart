
import 'package:news_app/core/resources/assets_manager.dart';

class CategoryModel{
  String id;
  String title;
  String imagePath;
  CategoryModel({required this.id , required this.title , required this.imagePath});

  static List<CategoryModel> AllCategories =[
    CategoryModel(id: "general",title: "General", imagePath: ImageAssets.General),
    CategoryModel(id: "sports", title: "Sports", imagePath:  ImageAssets.General),
    CategoryModel(id: "health",title: "Health", imagePath:  ImageAssets.General),
    CategoryModel(id: "business",title: "Business", imagePath:  ImageAssets.General),
    CategoryModel(id: "enviroment",title: "Enviroment", imagePath:  ImageAssets.General),
    CategoryModel(id: "science",title: "Science", imagePath:  ImageAssets.General),
  ];
}