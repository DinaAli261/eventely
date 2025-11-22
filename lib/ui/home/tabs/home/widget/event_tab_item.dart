import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

class EventTabItem extends StatelessWidget {
  bool isSelected;
  String eventName;
  IconData icon;
  Color selectedBgColor;
  Color borderColor;
  var selectedTextStyle;
  var unSelectedTextStyle;
  Color selectedIconColor;
  Color unSelectedIconColor;
  EventTabItem({super.key,
    required this.eventName,
    required this.isSelected,
    required this.icon,
    required this.selectedBgColor,
    required this.borderColor,
    required this.selectedTextStyle,
    required this.unSelectedTextStyle,
    required this.selectedIconColor,
    required this.unSelectedIconColor
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return Container(
      margin: EdgeInsets.only(
          top: height * 0.019
      ),
      padding: EdgeInsets.symmetric(
        vertical: height * 0.012,
        horizontal: 0.04 * width,
      ),
      decoration: BoxDecoration(
          color: (isSelected) ? selectedBgColor
              : AppColors.transparent,
          borderRadius: BorderRadius.circular(46),
          border: Border.all(
            color: borderColor,
            width: 2,
          )
      ),
      child: Row(
        children: [
          Icon(icon,
            color: (isSelected) ? selectedIconColor : unSelectedIconColor,),
          SizedBox(width: width * 0.02,),
          Text(eventName,
              style: (isSelected) ? selectedTextStyle
                  : unSelectedTextStyle),
        ],
      ),
    );
  }
}
