import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/home/widget/custom_elevated_button.dart';
import 'package:evently/utils/app_images.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.forgetPassword),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppImages.resetPassword),
            CustomElevatedButton(onPressed: () {}, text: "Reset Password"),
          ],
        ),
      ),
    );
  }
}
