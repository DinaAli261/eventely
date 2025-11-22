import 'package:evently/utils/App_text_styles.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_theme_provider.dart';

typedef OnValidator =String? Function(String?)?;
class CustomTextFormField extends StatelessWidget {

  Color borderSideColor;
  String? hintText;
  String? labelText;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  IconData? prefixIcon;
  IconData? suffixIcon;
  OnValidator? validator;
  TextInputType? keyboardType;
  bool? obscureText;
  String obscuringCharacter;
  TextEditingController? controller;
  int? maxLines;

  CustomTextFormField({
    super.key,
    this.borderSideColor = AppColors.grey,
    this.hintText,
    this.labelText,
    this.hintStyle,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.obscuringCharacter = ".",
    required this.controller,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    bool isDark = themeProvider.appTheme == ThemeMode.dark;
    return TextFormField(
      maxLines: maxLines,
      style: TextStyle(
          color: (isDark) ? AppColors.offWhite : AppColors.black
      ),
      controller: controller,
      obscureText: obscureText!,
      keyboardType: keyboardType,
      obscuringCharacter: obscuringCharacter,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: builtDecorationBorder(
            borderSideColor: (isDark && (borderSideColor == AppColors.grey))
                ? AppColors.blue
                : borderSideColor),
        focusedBorder: builtDecorationBorder(
            borderSideColor: (isDark && (borderSideColor == AppColors.grey))
                ? AppColors.blue
                : borderSideColor),
        errorBorder: builtDecorationBorder(borderSideColor: AppColors.red),
        focusedErrorBorder: builtDecorationBorder(
          borderSideColor: AppColors.red,
        ),
        hintText: hintText,
        hintStyle: hintStyle ??
            ((isDark) ? AppTextStyles.offWhite16Medium : AppTextStyles
                .grey16Medium),
        labelText: labelText,
        labelStyle: labelStyle ?? AppTextStyles.grey16Medium,
        prefixIcon: (prefixIcon == null) ? null : Icon(
            prefixIcon, color: (borderSideColor == AppColors.red)
            ? AppColors.offWhite
            : (hintStyle == AppTextStyles.blue14Bold)
            ? AppColors.blue
            : (isDark) ? AppColors.offWhite : AppColors.grey),
        suffixIcon: Icon(
            suffixIcon, color: (isDark) ? AppColors.offWhite : AppColors.grey),
      ),
    );
  }

  OutlineInputBorder builtDecorationBorder({required Color borderSideColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: borderSideColor, width: 1),
    );
  }
}
