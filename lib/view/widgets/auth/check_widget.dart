import 'package:asro_shop/logic/controllers/auth_controller.dart';
import 'package:asro_shop/utils/assets_path.dart';
import 'package:asro_shop/utils/theme.dart';
import 'package:asro_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({super.key});

  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) {
        return Row(
          children: [
            InkWell(
              onTap: () {
                controller.checkBox();
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: controller.isCheckBox
                    ? Get.isDarkMode
                        ? Image.asset(AssetPath.checkIcon)
                        : const Icon(
                            Icons.done,
                            size: 30,
                            color: pinkClr,
                          )
                    : Container(),
              ),
            ),
            const SizedBox(width: 10),
            Row(
              children: [
                TextUtils(
                  text: 'I accept ',
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                TextUtils(
                  text: 'terms & conditions',
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  underlineText: true,
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
