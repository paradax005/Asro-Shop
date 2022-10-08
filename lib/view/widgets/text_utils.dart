// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final bool underlineText;

  TextUtils({
    super.key,
    required this.text,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
    this.underlineText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        decoration: underlineText ? TextDecoration.underline : null,
        textStyle: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
