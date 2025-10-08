import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../ui/first_screen/select_widget.dart';
import '../../ui/home/widget/custom_elevated_button.dart';
import '../../ui/home/widget/custom_text_form_field.dart';
import '../../utils/App_text_styles.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_routes.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  RegisterScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        title: Text("Register"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.04,
        ),
        child: Column(
          children: [
            Image.asset(AppImages.logo),
            SizedBox(height: height * 0.02),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextFormField(
                    prefixIcon: Icon(Icons.lock, color: AppColors.grey),
                    controller: nameController,
                    hintText: "Name",
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "please Enter Name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextFormField(
                    prefixIcon: Icon(Icons.email, color: AppColors.grey),
                    controller: emailController,
                    hintText: AppLocalizations.of(context)!.email,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "please Enter Email";
                      }
                      final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(text);
                      if (!emailValid) {
                        return "please Enter A Valid Email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextFormField(
                    prefixIcon: Icon(Icons.lock, color: AppColors.grey),
                    controller: passwordController,
                    hintText: AppLocalizations.of(context)!.password,
                    keyboardType: TextInputType.number,
                    obscuringCharacter: "*",
                    obscureText: true,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "please Enter Password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextFormField(
                    prefixIcon: Icon(Icons.lock, color: AppColors.grey),
                    controller: rePasswordController,
                    hintText: "re Password",
                    keyboardType: TextInputType.number,
                    obscuringCharacter: "*",
                    obscureText: true,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "please Enter Password";
                      }
                      if (text == passwordController.text) {
                        return "password doesn't match ";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  CustomElevatedButton(
                    onPressed: login,
                    text: AppLocalizations.of(context)!.createAccount,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already Have Account ?",
                        style: AppTextStyles.black16Medium,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(
                            context,
                          ).pushNamed(AppRoutes.registerScreenRouteName);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.login,
                          style: AppTextStyles.blue16ItalicBold.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [SelectWidget(isLang: true)],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState?.validate() == true) {
      //todo:login
    }
  }
}
