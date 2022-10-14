import 'package:asro_shop/view/screens/category_screen.dart';
import 'package:asro_shop/view/screens/favorites_screen.dart';
import 'package:asro_shop/view/screens/home_screen.dart';
import 'package:asro_shop/view/screens/settings_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs =  [
    HomeScreen(),
    const CategoryScreen(),
    const FavoriteScreen(),
    const SettingsScreen(),
  ].obs ; 

  final mainScreenTitles = [
    'Asro Shop',
    'Categories',
    'Favorites',
    'Settings',
  ].obs ;
}
