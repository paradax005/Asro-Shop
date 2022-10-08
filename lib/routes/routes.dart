import 'package:get/get.dart';

import '../view/screens/welcome_screen.dart';

class AppRoutes {
  // Initial route
  static const welcome = Routes.welcomeScreen;

  // Get pages
  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
}
