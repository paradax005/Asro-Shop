import 'package:asro_shop/routes/routes.dart';
import 'package:asro_shop/utils/theme.dart';
import 'package:asro_shop/view/widgets/auth/container_under.dart';
import 'package:asro_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/auth/check_widget.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 40,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextUtils(
                            text: "SIGN",
                            color: mainColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          TextUtils(
                            text: "UP",
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      AuthTextFormField(
                        controller: nameController,
                        validator: () {},
                        prefixIcon: Image.asset('assets/images/user.png'),
                        suffixIcon: const Text(''),
                        hintText: 'User Name',
                      ),
                      const SizedBox(height: 20),
                      AuthTextFormField(
                        controller: emailController,
                        validator: () {},
                        prefixIcon: Image.asset('assets/images/email.png'),
                        suffixIcon: const Text(''),
                        hintText: 'Email',
                      ),
                      const SizedBox(height: 20),
                      AuthTextFormField(
                        controller: passwordController,
                        validator: () {},
                        prefixIcon: Image.asset('assets/images/lock.png'),
                        suffixIcon: const Text(''),
                        hintText: 'Password',
                        obscureText: true,
                      ),
                      const SizedBox(height: 50),
                      const CheckWidget(),
                      const SizedBox(
                        height: 50,
                      ),
                      AuthButton(
                        text: "SIGN UP",
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              ContainerUnder(
                text: 'Alerady Have an account?  ',
                textType: 'SignUp',
                onPressed: () {
                  Get.toNamed(Routes.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
