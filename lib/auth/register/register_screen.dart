import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../ui/first_screen/select_widget.dart';
import '../../ui/home/widget/custom_elevated_button.dart';
import '../../ui/home/widget/custom_text_form_field.dart';
import '../../utils/App_text_styles.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_routes.dart';

class RegisterScreen extends StatefulWidget {

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController rePasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        title: Text(AppLocalizations.of(context)!.register,
          style: AppTextStyles.blue22Regular,),
        centerTitle: true,
        iconTheme: IconThemeData(
            color: AppColors.blue
        ),
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
                    prefixIcon: Icons.lock,
                    controller: nameController,
                    hintText: AppLocalizations.of(context)!.name,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return AppLocalizations.of(context)!.please_enter_name;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextFormField(
                    prefixIcon: Icons.email,
                    controller: emailController,
                    hintText: AppLocalizations.of(context)!.email,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return AppLocalizations.of(context)!.please_enter_email;
                      }
                      final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(text);
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
                      if (text == null || text.trim().isEmpty) {
                        return AppLocalizations.of(context)!
                            .please_enter_password;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextFormField(
                    prefixIcon: Icons.lock,
                    controller: rePasswordController,
                    hintText: AppLocalizations.of(context)!.re_password,
                    keyboardType: TextInputType.number,
                    obscuringCharacter: "*",
                    obscureText: true,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return AppLocalizations.of(context)!
                            .please_enter_password;
                      }
                      if (text != passwordController.text) {
                        return AppLocalizations.of(context)!
                            .password_does_not_match;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  CustomElevatedButton(
                    onPressed: register,
                    text: AppLocalizations.of(context)!.create_account,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${AppLocalizations.of(context)!
                            .already_have_account} ?",
                        style: Theme
                            .of(context)
                            .textTheme
                            .labelMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
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

  void register() {
    if (formKey.currentState?.validate() == true) {
      //todo:login
      Navigator.of(context).pushReplacementNamed(AppRoutes.homeScreenRouteName);
    }
  }
}
