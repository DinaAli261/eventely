import 'package:evently/utils/App_text_styles.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  Color borderSideColor;
  String? hintText;
  String? labelText;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;

  CustomTextFormField({
    super.key,
    this.borderSideColor = AppColors.grey,
    this.hintText,
    this.labelText,
    this.hintStyle,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: builtDecorationBorder(borderSideColor: borderSideColor),
        focusedBorder: builtDecorationBorder(borderSideColor: borderSideColor),
        errorBorder: builtDecorationBorder(borderSideColor: AppColors.red),
        focusedErrorBorder: builtDecorationBorder(
          borderSideColor: AppColors.red,
        ),
        hintText: hintText,
        hintStyle: hintStyle ?? AppTextStyles.grey16Medium,
        labelText: labelText,
        labelStyle: labelStyle ?? AppTextStyles.grey16Medium,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
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
