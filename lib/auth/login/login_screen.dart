import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/home/widget/custom_elevated_button.dart';
import 'package:evently/ui/home/widget/custom_text_form_field.dart';
import 'package:evently/utils/App_text_styles.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_images.dart';
import 'package:flutter/material.dart';

import '../../ui/first_screen/select_widget.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          children: [
            Image.asset("assets/images/logo.png"),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextFormField(
                    prefixIcon: Icon(Icons.email, color: AppColors.grey),
                    controller: emailController,
                    hintText: AppLocalizations.of(context)!.email,
                    validator: (text) {
                      if (text == null || text
                          .trim()
                          .isEmpty) {
                        return "please Enter Email";
                      }
                      final bool emailValid =
                      RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text);
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
                        if (text == null || text
                            .trim()
                            .isEmpty) {
                          return "please Enter Password";
                        }
                        return null;
                      }
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Align(
                      alignment: AlignmentGeometry.centerRight,
                      child: Text(
                        AppLocalizations.of(context)!.forgetPassword,
                        style: AppTextStyles.blue16ItalicBold.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.blue,
                        ),
                      ),
                    ),
                  ),
                  CustomElevatedButton(
                    onPressed: login,
                    text: AppLocalizations.of(context)!.login,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.doNotHaveAccount,
                        style: AppTextStyles.black16Medium,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          AppLocalizations.of(context)!.createAccount,
                          style: AppTextStyles.blue16ItalicBold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.blue,
                          thickness: 1,
                          indent: 0.06 * width,
                          endIndent: 0.04 * width,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.or,
                        style: AppTextStyles.blue16Medium,
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColors.blue,
                          thickness: 1,
                          indent: 0.04 * width,
                          endIndent: 0.06 * width,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  CustomElevatedButton(
                    onPressed: () {},
                    text: AppLocalizations.of(context)!.loginWithGoogle,
                    backgroundColor: AppColors.transparent,
                    borderColor: AppColors.blue,
                    haveIcon: true,
                    textStyle: AppTextStyles.blue20Medium,
                    icon: Image.asset(AppImages.google),
                    isCenter: true,
                  ),
                  SizedBox(height: height * 0.02),
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
