const String imagePath = "assets/images";
const String iconsPath = "assets/icons";


abstract class ImageAssets {
  static const String General = "$imagePath/earth-1303628_1920.png";
  static const String Sports = "$imagePath/7231190-removebg-preview.png";
  static const String Health = "$imagePath/3486168-removebg-preview.png";
  static const String Business = "$imagePath/business.png";
  static const String Entertainment = "$imagePath/12759-removebg-preview.png";
  static const String Science = "$imagePath/School_Science_And_Education_concept_-10-removebg-preview.png";
  static const String Technology = "$imagePath/01d98a63-915e-4e9e-8098-d118cef3e431-removebg-preview.png";
  static const String Error = "$imagePath/error.png";

}
abstract class IconsAssets {
  static const String _icHome = "$iconsPath/home-button.png";

  
  static String get icHome => _icHome;
}
