import 'package:asro_shop/logic/controllers/auth_controller.dart';
import 'package:asro_shop/logic/controllers/theme_controller.dart';
import 'package:asro_shop/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                ThemeController().changeTheme();
              },
              child: Text(
                'Dark Mode',
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GetBuilder<AuthController>(
              builder: (controller) {
                return TextButton(
                  onPressed: () {
                    Get.defaultDialog(
                      title: "LogOut From Asro Shop?",
                      titleStyle: TextStyle(
                        fontSize: 18,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      middleText: "",
                      middleTextStyle: const TextStyle(
                        fontSize: 8,
                      ),
                      radius: 10,
                      backgroundColor:
                          !Get.isDarkMode ? darkGreyClr : Colors.white,
                      textCancel: 'No',
                      cancelTextColor:
                          Get.isDarkMode ? Colors.black : Colors.white,
                      onCancel: () {
                        Get.back();
                      },
                      textConfirm: "Yes",
                      confirmTextColor:
                          Get.isDarkMode ? Colors.black : Colors.white,
                      onConfirm: () {
                        controller.logOut();
                      },
                      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                    );
                  },
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
