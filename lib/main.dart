import 'package:asro_shop/logic/controllers/theme_controller.dart';
import 'package:asro_shop/routes/routes.dart';
import 'package:asro_shop/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Asro Shop',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeController().themeDataGet,
      theme: ThemeApp.light,
      darkTheme: ThemeApp.dark,
      initialRoute: AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}
