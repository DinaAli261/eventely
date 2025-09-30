import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_language_provider.dart';
import '../../providers/app_theme_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/shared_preferences_helper.dart';

class SelectWidget extends StatefulWidget {
  bool isLang;

  SelectWidget({super.key, required this.isLang});

  @override
  State<SelectWidget> createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    bool isSelectedAr = languageProvider.appLanguage == "ar";
    bool isSelectedEN = languageProvider.appLanguage == "en";
    bool isSelectedDark = themeProvider.appTheme == ThemeMode.dark;
    bool isSelectedLight = themeProvider.appTheme == ThemeMode.light;
    return Container(
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: AppColors.transparent,
        border: BoxBorder.all(width: 2, color: AppColors.blue),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              (widget.isLang)
                  ? {
                      isSelectedAr = true,
                      isSelectedEN = false,
                      languageProvider.changeLanguage('ar'),
                      saveLastLang("ar"),
                    }
                  : {
                      isSelectedDark = true,
                      isSelectedLight = false,
                      themeProvider.changeTheme(ThemeMode.dark),
                      saveLastTheme("dark"),
                    };
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                border:
                    ((widget.isLang && isSelectedAr) ||
                        (isSelectedDark && (!widget.isLang)))
                    ? Border.all(width: 3, color: AppColors.blue)
                    : null,
                borderRadius: BorderRadius.circular(30),
              ),
              child: (widget.isLang)
                  ? Image.asset(AppImages.eg, height: 25, width: 25)
                  : Icon(Icons.dark_mode, color: AppColors.blue),
            ),
          ),
          SizedBox(width: 20),
          InkWell(
            onTap: () {
              (widget.isLang)
                  ? {
                      isSelectedAr = false,
                      isSelectedEN = true,
                      languageProvider.changeLanguage('en'),
                      saveLastLang("en"),
                    }
                  : {
                      isSelectedDark = false,
                      isSelectedLight = true,
                      themeProvider.changeTheme(ThemeMode.light),
                      saveLastTheme("light"),
                    };
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                border:
                    ((widget.isLang && isSelectedEN) ||
                        (isSelectedLight && (!widget.isLang)))
                    ? BoxBorder.all(width: 3, color: AppColors.blue)
                    : null,
                borderRadius: BorderRadius.circular(30),
              ),
              child: (widget.isLang)
                  ? Image.asset(AppImages.us, height: 25, width: 25)
                  : Container(
                      decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.light_mode_outlined,
                        color: AppColors.white,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
