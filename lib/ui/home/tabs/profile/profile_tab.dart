import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/app_language_provider.dart';
import 'package:evently/providers/app_theme_provider.dart';
import 'package:evently/ui/home/tabs/profile/theme/theme_bottom_sheet.dart';
import 'package:evently/ui/home/widget/custom_elevated_button.dart';
import 'package:evently/utils/App_text_styles.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'language/language_bottom_sheet.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blue,
          toolbarHeight: 156,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.only(
                bottomLeft: Radius.circular(64),
              )
          ),
          title: Row(
            children: [
              Image.asset(AppImages.routeProfile),
              SizedBox(width: width * 0.04,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('RouteAcademy', style: AppTextStyles.offWhite24Bold,),
                    Text('routeacadmy@gmail.com',
                      style: AppTextStyles.offWhite16Medium,
                      overflow: TextOverflow.visible,
                      softWrap: true,
                      maxLines: 3,
                    )

                  ],
                ),
              )
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.028,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context)!.language,
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineLarge,
              ),
              SizedBox(height: height * 0.019),
              InkWell(
                onTap: () {
                  showLanguageBottomSheet();
                },
                child: Container(
                  padding: EdgeInsets.all(width * 0.04),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: BoxBorder.all(width: 1, color: AppColors.blue),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        (languageProvider.appLanguage == 'en')
                            ? AppLocalizations.of(context)!.english
                            : AppLocalizations.of(context)!.arabic,
                        style: AppTextStyles.blue20Bold,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.blue,
                        size: height * 0.04,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.019),
              Text(
                AppLocalizations.of(context)!.theme,
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineLarge,
              ),
              SizedBox(height: height * 0.019),
              InkWell(
                onTap: () {
                  showThemeBottomSheet();
                },
                child: Container(
                  padding: EdgeInsets.all(width * 0.04),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: BoxBorder.all(width: 1, color: AppColors.blue),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        (themeProvider.appTheme == ThemeMode.light)
                            ? AppLocalizations.of(context)!.light
                            : AppLocalizations.of(context)!.dark,
                        style: AppTextStyles.blue20Bold,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.blue,
                        size: height * 0.04,
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              CustomElevatedButton(
                onPressed: () {},
                text: AppLocalizations.of(context)!.logout,
                icon: Icon(
                  Icons.logout, color: AppColors.offWhite, size: width * 0.06,),
                textStyle: AppTextStyles.offWhite20Regular,
                haveIcon: true,
                backgroundColor: AppColors.red,),
              SizedBox(height: height * 0.025)
            ],
          ),
        ),
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}
