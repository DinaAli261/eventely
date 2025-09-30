import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/first_screen/select_widget.dart';
import 'package:evently/utils/App_text_styles.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_theme_provider.dart';
import '../../utils/app_colors.dart';

class FirstScreen extends StatefulWidget {

  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();

}

class _FirstScreenState extends State<FirstScreen> {
  Widget buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName.png', width: width);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    final isDark = themeProvider.appTheme == ThemeMode.dark;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(width * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildImage('onboarding', width * 0.40),
              buildImage((isDark) ? 'onboarding1_dark' : 'onboarding1'),
              Text(
                AppLocalizations.of(context)!.firstScreenTitle,
                style: AppTextStyles.blue20Bold,
              ),
              Text(
                AppLocalizations.of(context)!.firstScreenBody,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: (isDark) ? AppColors.white : AppColors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.language,
                    style: AppTextStyles.blue20Medium,
                  ),
                  SelectWidget(isLang: true,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.theme,
                    style: AppTextStyles.blue20Medium,
                  ),
                  SelectWidget(isLang: false,),

                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(
                      AppRoutes.onboardingRouteName);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(width * 0.04),
                  backgroundColor: AppColors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: const Text(
                  'Let’s Start',
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
