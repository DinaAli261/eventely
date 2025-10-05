import 'package:evently/utils/App_text_styles.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

class EventTabItem extends StatelessWidget {
  bool isSelected;
  String eventName;
  IconData icon;

  EventTabItem(
      {super.key, required this.eventName, required this.isSelected, required this.icon});

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
          color: (isSelected) ? Theme
              .of(context)
              .focusColor : AppColors.transparent,
          borderRadius: BorderRadius.circular(46),
          border: Border.all(
            color: Theme
                .of(context)
                .focusColor,
            width: 2,
          )
      ),
      child: Row(
        children: [
          Icon(icon, color: (isSelected) ? Theme
              .of(context)
              .secondaryHeaderColor : AppColors.offWhite,),
          SizedBox(width: width * 0.02,),
          Text(eventName,
              style: (isSelected) ? Theme
                  .of(context)
                  .textTheme
                  .headlineMedium : AppTextStyles.offWhite16Medium),
        ],
      ),
    );
  }
}
