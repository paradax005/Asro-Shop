import 'package:asro_shop/utils/theme.dart';
import 'package:asro_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const AuthButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: mainColor,
        minimumSize: const Size(360, 50),
      ),
      child: TextUtils(
        text: text,
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
