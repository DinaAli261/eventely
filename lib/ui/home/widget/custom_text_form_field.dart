import 'package:evently/utils/App_text_styles.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

typedef OnValidator =String? Function(String?)?;
class CustomTextFormField extends StatelessWidget {
  Color borderSideColor;
  String? hintText;
  String? labelText;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  OnValidator? validator;
  TextInputType? keyboardType;
  bool? obscureText;
  String obscuringCharacter;
  TextEditingController? controller;

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
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText!,
      keyboardType: keyboardType,
      obscuringCharacter: obscuringCharacter,
      validator: validator,
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
