import 'package:asro_shop/logic/bindings/auth_binding.dart';
import 'package:asro_shop/view/screens/auth/login_screen.dart';
import 'package:asro_shop/view/screens/auth/signup_screen.dart';
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
    GetPage(
      name: Routes.loginScreen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
}
