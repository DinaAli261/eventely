import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/utils/App_text_styles.dart';
import 'package:evently/utils/app_images.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          toolbarHeight: 156,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.only(
              bottomLeft: Radius.circular(64),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${AppLocalizations.of(context)!.welcomeBack} ✨",
                    style: AppTextStyles.offWhite14Regular,
                  ),
                  Text("Route Academy", style: AppTextStyles.offWhite24Bold),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ImageIcon(
                        AssetImage(AppImages.unselectedMap),
                        color: AppColors.offWhite,
                      ),
                      Text(
                        "${AppLocalizations.of(context)!.cairo} , ${AppLocalizations.of(context)!.egypt}",
                        style: AppTextStyles.offWhite14Medium,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.light_mode_outlined, color: AppColors.offWhite),
                  SizedBox(width: width * 0.025),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      AppLocalizations.of(context)!.en,
                      style: AppTextStyles.blue20Bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
