import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/utils/App_text_styles.dart';
import 'package:evently/utils/app_images.dart';
import 'package:flutter/material.dart';

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
    bool switchValue = true;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildImage('onboarding', 159),
              buildImage((isDark) ? 'onboarding1_dark' : 'onboarding1'),
              Text(
                AppLocalizations.of(context)!.firstScreenTitle,
                style: AppTextStyles.blue20Bold,
              ),
              Text(
                AppLocalizations.of(context)!.fristScreenBody,
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
                ],
              ),
              Image.asset(AppImages.eg, height: 20, width: 20),
              Image.asset(AppImages.us, height: 20, width: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.theme,
                    style: AppTextStyles.blue20Medium,
                  ),

                  Switch(
                    activeThumbImage: AssetImage(AppImages.eg),
                    inactiveThumbImage: AssetImage(AppImages.us),
                    activeThumbColor: AppColors.transparent,
                    inactiveThumbColor: AppColors.transparent,
                    value: switchValue,
                    onChanged: (value) {
                      setState(() {
                        switchValue = value;
                      });
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16),
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

//PageViewModel(
//           titleWidget: createTitleWidget("Personalize Your Experience"),
//           bodyWidget: createBodyWidget(
//             "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
//             isDark,
//             isFirst: true,
//           ),
//           image: _buildImage((isDark) ? 'onboarding1_dark' : 'onboarding1'),
//           footer: ElevatedButton(
//             onPressed: () {
//               introKey.currentState?.animateScroll(0);
//             },
//             style: ElevatedButton.styleFrom(
//               padding: EdgeInsets.all(16),
//               backgroundColor: AppColors.blue,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16.0),
//               ),
//             ),
//             child: const Text(
//               'Let’s Start',
//               style: TextStyle(color: AppColors.white),
//             ),
//           ),
//           decoration: pageDecoration.copyWith(
//             bodyFlex: 6,
//             imageFlex: 6,
//             safeArea: 80,
//           ),
//         ),
