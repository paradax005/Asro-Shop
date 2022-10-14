import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/assets_path.dart';
import '../../../utils/pattern.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/auth/container_under.dart';
import '../../widgets/text_utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: context.theme.backgroundColor,
          elevation: 0,
        ),
        backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.25,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 40,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              text: "LOG",
                              color: Get.isDarkMode ? pinkClr : mainColor,
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                              text: "IN",
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        AuthTextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return 'Invalid email';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: !Get.isDarkMode
                              ? Image.asset(AssetPath.emailIcon)
                              : const Icon(
                                  Icons.email,
                                  size: 30,
                                  color: pinkClr,
                                ),
                          suffixIcon: const Text(''),
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 20),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthTextFormField(
                              controller: passwordController,
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return 'Password should be longer or equal to 6 characters';
                                } else {
                                  return null;
                                }
                              },
                              prefixIcon: !Get.isDarkMode
                                  ? Image.asset(AssetPath.lockIcon)
                                  : const Icon(
                                      Icons.lock,
                                      size: 30,
                                      color: pinkClr,
                                    ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visibility();
                                },
                                icon: !controller.isVisibilty
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      ),
                              ),
                              hintText: 'Password',
                              obscureText: !controller.isVisibilty,
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.forgotPasswordScreen);
                            },
                            child: TextUtils(
                              text: "Forgot Password?",
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                              text: "LOG IN",
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  String email =
                                      emailController.text.toString();
                                  String password =
                                      passwordController.text.toString();
                                  controller.loginWithEmailAndPassword(
                                    email: email,
                                    password: password,
                                  );
                                }
                              });
                        }),
                        const SizedBox(height: 30),
                        TextUtils(
                          text: "OR",
                          color: !Get.isDarkMode ? Colors.black : Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.facebookSignUp();
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Image.asset(AssetPath.fbIcon),
                              ),
                            ),
                            const SizedBox(width: 20),
                            GetBuilder<AuthController>(builder: (_) {
                              return InkWell(
                                onTap: () {
                                  controller.googleSignUp();
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Image.asset(AssetPath.googleIcon),
                                ),
                              );
                            })
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: 'Don\'t Have an Account?',
                textType: 'Sign up',
                onPressed: () {
                  Get.offNamed(Routes.signUpScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
