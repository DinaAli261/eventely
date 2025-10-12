import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/home/widget/custom_elevated_button.dart';
import 'package:evently/utils/App_text_styles.dart';
import 'package:evently/utils/app_colors.dart';
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
        backgroundColor: AppColors.transparent,
        title: Text(AppLocalizations.of(context)!.forget_password,
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppImages.reset),
            CustomElevatedButton(onPressed: () {},
                text: AppLocalizations.of(context)!.reset_password),
          ],
        ),
      ),
    );
  }
}
