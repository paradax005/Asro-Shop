import 'package:asro_shop/logic/bindings/auth_binding.dart';
import 'package:asro_shop/logic/bindings/main_binding.dart';
import 'package:asro_shop/view/screens/auth/login_screen.dart';
import 'package:asro_shop/view/screens/auth/signup_screen.dart';
import 'package:asro_shop/view/screens/main_screen.dart';
import 'package:get/get.dart';
import '../view/screens/auth/forgot_password_screen.dart';
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
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => FrogotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
      ],
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotPasswordScreen = '/forgotPassword';
  static const mainScreen = '/mainScreen';
}
