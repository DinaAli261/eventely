import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/home/widget/custom_elevated_button.dart';
import 'package:evently/ui/home/widget/custom_text_form_field.dart';
import 'package:evently/utils/App_text_styles.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_images.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:flutter/material.dart';

import '../../ui/first_screen/select_widget.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
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
                      prefixIcon: Icons.email,
                      controller: emailController,
                      hintText: AppLocalizations.of(context)!.email,
                      validator: (text) {
                        if (text == null || text
                            .trim()
                            .isEmpty) {
                          return AppLocalizations.of(context)!
                              .please_enter_email;
                        }
                        final bool emailValid =
                        RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text);
                        if (!emailValid) {
                          return AppLocalizations.of(context)!
                              .please_enter_a_valid_email;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    CustomTextFormField(
                        prefixIcon: Icons.lock,
                        controller: passwordController,
                        hintText: AppLocalizations.of(context)!.password,
                        keyboardType: TextInputType.number,
                        obscuringCharacter: "*",
                        obscureText: true,
                        validator: (text) {
                          if (text == null || text
                              .trim()
                              .isEmpty) {
                            return AppLocalizations.of(context)!
                                .please_enter_password;
                          }
                          return null;
                        }
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                            AppRoutes.resetPasswordRouteName);
                      },
                      child: Align(
                        alignment: AlignmentGeometry.centerRight,
                        child: Text(
                          "${AppLocalizations.of(context)!.forget_password} ?",
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
                          AppLocalizations.of(context)!.do_not_have_account,
                          style: Theme
                              .of(context)
                              .textTheme
                              .labelMedium,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                                AppRoutes.registerScreenRouteName);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.create_account,
                            style: AppTextStyles.blue16ItalicBold.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.blue,
                            ),
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
                      text: AppLocalizations.of(context)!.login_with_google,
                      icon: Image.asset(AppImages.google),
                      backgroundColor: AppColors.transparent,
                      borderColor: AppColors.blue,
                      haveIcon: true,
                      textStyle: AppTextStyles.blue20Medium,
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
      ),
    );
  }

  void login() {
    if (formKey.currentState?.validate() == true) {
      //todo:login
      Navigator.of(context).pushReplacementNamed(AppRoutes.homeScreenRouteName);
    }
  }
}
