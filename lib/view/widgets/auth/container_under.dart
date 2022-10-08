import 'package:asro_shop/utils/theme.dart';
import 'package:asro_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final String textType;
  const ContainerUnder({
    super.key,
    required this.text,
    required this.onPressed,
    required this.textType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height -
          (MediaQuery.of(context).size.height / 1.3 +
              AppBar().preferredSize.height +
              20),
      decoration: BoxDecoration(
        color: Get.isDarkMode ? mainColor : pinkClr,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
            text: text,
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          TextButton(
            onPressed: onPressed,
            child: TextUtils(
              text: textType,
              underlineText: true,
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
