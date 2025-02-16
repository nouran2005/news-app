const String imagePath = "assets/images";
const String iconsPath = "assets/icons";


abstract class ImageAssets {
  static const String General = "$imagePath/earth-1303628_1920.png";
  static const String categoryCardImage = "$imagePath/category_card_image.png";

  static const String subcategoryCardImage ="$imagePath/sub_category_card_image.png";
  static const String carouselSlider1 = "$imagePath/CarouselSlider1.png";

  static const String categoryHomeImage = "$imagePath/category_image.jpg";
  static const String carouselSlider2 = "$imagePath/CarouselSlider2.png";
  static const String carouselSlider3 = "$imagePath/CarouselSlider3.png";
  static const String brandHomeImage = "$imagePath/brands_section_image.png";
  static const String productImage = "$imagePath/product_image.png";

  static const String rate = "$imagePath/rate.png";

  static const String shoppingCart = "$imagePath/shopping_cart.png";
  static const String favoriteIcon = "$imagePath/favorite.png";
  static const String notFavoriteIcon = "$imagePath/not_favorite.png";
  static const String searchIcon = "$imagePath/search.png";
}
/*
class SvgAssets{
  static const String routeLogo = "$svgPath/route.svg";
  static const String eye = "$svgPath/Eye.svg";
  static const String edit = "$svgPath/edit (1) 5.svg";
}*/
abstract class IconsAssets {
  static const String _icHome = "$iconsPath/home-button.png";

  
  static String get icHome => _icHome;
}

/*

class JsonAssets {
  static const String loading = "$jsonPath/loading.json";
  static const String error = "$jsonPath/error.json";
  static const String empty = "$jsonPath/empty.json";
  static const String success = "$jsonPath/success.json";
}
*/