import 'package:asro_shop/logic/controllers/auth_controller.dart';
import 'package:asro_shop/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/pattern.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_form_field.dart';

class FrogotPasswordScreen extends StatelessWidget {
  FrogotPasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          title: Text(
            'Forgot Password',
            style: TextStyle(
              color: Get.isDarkMode ? mainColor : pinkClr,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Get.isDarkMode ? Colors.black : Colors.white,
            ),
          ),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                children: [
                  Text(
                    "If you want to recover your account, then please provide your email ID below ...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Image.asset(
                    AssetPath.forgotPassword,
                    width: 280,
                  ),
                  const SizedBox(height: 30),
                  AuthTextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (!RegExp(validationEmail).hasMatch(value)) {
                        return 'Invalid email';
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: Get.isDarkMode
                        ? Image.asset(AssetPath.emailIcon)
                        : const Icon(
                            Icons.email,
                            size: 30,
                            color: pinkClr,
                          ),
                    suffixIcon: const Text(''),
                    hintText: 'Email',
                  ),
                  const SizedBox(height: 50),
                  GetBuilder<AuthController>(builder: (_) {
                    return AuthButton(
                      text: "SEND",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          String email = emailController.text.trim();
                          controller.resetPassword(email: email);
                        }
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
