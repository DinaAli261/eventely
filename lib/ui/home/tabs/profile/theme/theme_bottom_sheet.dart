import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../../../../utils/App_text_styles.dart';
import '../../../../../utils/app_colors.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var selectedTheme = themeProvider.appTheme;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.light);
              selectedTheme = ThemeMode.light;
            },
            child: getLightItemWidget(selectedTheme),
          ),
          SizedBox(height: height * 0.02),
          InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.dark);
              selectedTheme = ThemeMode.dark;
            },
            child: getDarkItemWidget(selectedTheme),
          ),
        ],
      ),
    );
  }

  Widget getLightItemWidget(ThemeMode selectedTheme) {
    if (selectedTheme == ThemeMode.light) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.light,
            style: AppTextStyles.blue20Bold,
          ),
          Icon(Icons.check, color: AppColors.blue),
        ],
      );
    } else {
      return Text(
        AppLocalizations.of(context)!.light,
        style: AppTextStyles.black20Bold,
      );
    }
  }

  Widget getDarkItemWidget(ThemeMode selectedTheme) {
    if (selectedTheme == ThemeMode.dark) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.dark,
            style: AppTextStyles.blue20Bold,
          ),
          Icon(Icons.check, color: AppColors.blue),
        ],
      );
    } else {
      return Text(
        AppLocalizations.of(context)!.dark,
        style: AppTextStyles.black20Bold,
      );
    }
  }
}
