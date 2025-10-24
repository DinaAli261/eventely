import 'package:evently/model/event.dart';
import 'package:evently/utils/App_text_styles.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventItem extends StatefulWidget {
  final Event event;

  EventItem({super.key, required this.event});

  bool isFavorite = false;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
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
          left: height * 0.019,
          right: height * 0.019,
        ),
        height: 0.24 * height,
        width: 0.52 * width,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: AssetImage(widget.event.eventImage), fit: BoxFit.fill),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(0.009 * height),
                padding: EdgeInsets.all(0.009 * height),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme
                        .of(context)
                        .cardColor
                ),
                child: Column(
                  children: [
                    Text(widget.event.eventDateTime.day.toString(),
                        style: AppTextStyles.blue14Bold),
                    Text(DateFormat('MMM').format(widget.event.eventDateTime),
                        style: AppTextStyles.blue14Bold),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(0.009 * height),
                padding: EdgeInsets.all(0.009 * height),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme
                        .of(context)
                        .cardColor
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        widget.event.title,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall,
                        softWrap: true,
                        maxLines: 2,),
                    ),
                    InkWell(
                        onTap: (() {
                          widget.isFavorite = !widget.isFavorite;
                          setState(() {});
                        }),
                        child: Icon((widget.isFavorite) ? Icons.favorite : Icons
                            .favorite_border_outlined, color: AppColors.blue,)),
                  ],
                ),
              ),

            ]
        ));
  }
}
