import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function validator;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  final bool obscureText;

  const AuthTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    this.obscureText = false,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        prefixIcon: prefixIcon,
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        // enabled border
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        // focused border
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        // error border
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
        // focused Error border
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
