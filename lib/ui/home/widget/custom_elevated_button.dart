import 'package:evently/utils/App_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final Color borderColor;

  final bool haveIcon;
  final bool isCenter;
  Widget? icon;

  CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = AppColors.blue,
    this.borderColor = AppColors.transparent,
    this.textStyle,
    this.haveIcon = false,
    this.icon,
    this.isCenter = false,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.all(width * 0.04),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(color: borderColor, width: 1),
        ),
      ),
      child: (haveIcon)
          ? Row(
              mainAxisAlignment: (isCenter)
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                icon ?? SizedBox(),
                SizedBox(width: width * 0.02),
                Text(text, style: textStyle ?? AppTextStyles.offWhite20Medium),
              ],
            )
          : Text(text, style: textStyle ?? AppTextStyles.offWhite20Medium),
    );
  }
}
