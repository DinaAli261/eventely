import 'package:evently/model/event.dart';
import 'package:evently/providers/event_list_provider.dart';
import 'package:evently/utils/App_text_styles.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventItem extends StatelessWidget {
  final Event event;

  const EventItem({super.key, required this.event});
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
    var eventListProvider = Provider.of<EventListProvider>(context);
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
              image: AssetImage(event.eventImage), fit: BoxFit.fill),
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
                    Text(event.eventDateTime.day.toString(),
                        style: AppTextStyles.blue14Bold),
                    Text(DateFormat('MMM').format(event.eventDateTime),
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
                        event.title,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall,
                        softWrap: true,
                        maxLines: 2,),
                    ),
                    InkWell(
                        onTap: (() {
                          eventListProvider.updateIsFavoriteEvent(
                              event, context);

                        }),
                        child: Icon((event.isFavorite) ? Icons.favorite : Icons
                            .favorite_border_outlined, color: AppColors.blue,)),
                  ],
                ),
              ),

            ]
        ));
  }
}
