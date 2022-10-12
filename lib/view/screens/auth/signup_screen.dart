import 'package:asro_shop/logic/controllers/auth_controller.dart';
import 'package:asro_shop/routes/routes.dart';
import 'package:asro_shop/utils/assets_path.dart';
import 'package:asro_shop/utils/pattern.dart';
import 'package:asro_shop/utils/theme.dart';
import 'package:asro_shop/view/widgets/auth/container_under.dart';
import 'package:asro_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/auth/check_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: !Get.isDarkMode ? Colors.white : darkGreyClr,
          elevation: 0,
        ),
        backgroundColor: !Get.isDarkMode ? Colors.white : darkGreyClr,
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
                              text: "SIGN",
                              color: !Get.isDarkMode ? mainColor : pinkClr,
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                              text: "UP",
                              color:
                                  !Get.isDarkMode ? Colors.black : Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        AuthTextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'Enter valid username';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: !Get.isDarkMode
                              ? Image.asset(AssetPath.userIcon)
                              : const Icon(
                                  Icons.person,
                                  size: 30,
                                  color: pinkClr,
                                ),
                          suffixIcon: const Text(''),
                          hintText: 'User Name',
                        ),
                        const SizedBox(height: 20),
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
                                icon: controller.isVisibilty
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
                        const SizedBox(height: 50),
                        CheckWidget(),
                        const SizedBox(
                          height: 50,
                        ),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthButton(
                              text: "SIGN UP",
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  if (!controller.isCheckBox) {
                                    Get.snackbar(
                                      'Check Box',
                                      'Please Accept terms and conditions !',
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white,
                                    );
                                  } else {
                                    String name =
                                        nameController.text.toString().trim();
                                    String email =
                                        emailController.text.toString();
                                    String password =
                                        passwordController.text.toString();

                                    controller.signUpWithEmailAndPassword(
                                      name: name,
                                      email: email,
                                      password: password,
                                    );
                                  }
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: 'Already Have an Account?',
                textType: 'Log in',
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
