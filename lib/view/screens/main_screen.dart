import 'package:asro_shop/logic/controllers/main_controller.dart';
import 'package:asro_shop/utils/assets_path.dart';
import 'package:asro_shop/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              mainController
                  .mainScreenTitles[mainController.currentIndex.value],
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Get.isDarkMode ? mainColor : darkGreyClr,
            leading: Container(),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(AssetPath.shopIcon),
              ),
            ],
          ),
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
            currentIndex: mainController.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? mainColor : pinkClr,
                ),
                icon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? mainColor : pinkClr,
                ),
                icon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? mainColor : pinkClr,
                ),
                icon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? mainColor : pinkClr,
                ),
                icon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
                label: '',
              ),
            ],
            onTap: (index) {
              mainController.currentIndex.value = index;
            },
          ),
          body: IndexedStack(
            index: mainController.currentIndex.value,
            children: mainController.tabs.value,
          ),
        );
      }),
    );
  }
}
