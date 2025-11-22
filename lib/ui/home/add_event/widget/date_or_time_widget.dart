import 'package:evently/utils/App_text_styles.dart';
import 'package:flutter/material.dart';

class DateOrTimeWidget extends StatelessWidget {
  IconData iconName;
  String rowText;
  String rowTextButton;
  final VoidCallback onPressed;

  DateOrTimeWidget({
    super.key,
    required this.iconName,
    required this.onPressed,
    required this.rowText,
    required this.rowTextButton,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Icon(iconName, color: Theme.of(context).disabledColor),
        SizedBox(width: width * 0.02),
        Text(rowText, style: Theme.of(context).textTheme.labelMedium),
        Spacer(),
        TextButton(
          onPressed: onPressed,
          child: Text(rowTextButton, style: AppTextStyles.blue16Medium),
        ),
      ],
    );
  }
}
