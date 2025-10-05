import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/home/tabs/home/widget/event_item.dart';
import 'package:evently/ui/home/tabs/home/widget/event_tab_item.dart';
import 'package:evently/utils/App_text_styles.dart';
import 'package:evently/utils/app_images.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery
        .of(context)
        .size
        .height;

    List<String> eventNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.bookClub,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];
    List<IconData> eventIconsList = [
      Icons.explore_outlined,
      Icons.directions_bike_outlined,
      Icons.cake_outlined,
      Icons.groups_outlined,
      Icons.sports_esports_outlined,
      Icons.computer,
      Icons.menu_book_outlined,
      Icons.palette,
      Icons.beach_access_outlined,
      Icons.fastfood_outlined,
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          toolbarHeight: 0.20 * height,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24)
            ),
          ),
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "${AppLocalizations.of(context)!.welcomeBack} ✨",
                        style: AppTextStyles.offWhite14Regular,
                      ),
                      Text(
                          "Route Academy", style: AppTextStyles.offWhite24Bold),
                      SizedBox(height: 0.009 * height,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ImageIcon(
                            AssetImage(AppImages.unselectedMap),
                            color: AppColors.offWhite,
                          ),

                          Text(
                            "${AppLocalizations.of(context)!
                                .cairo} , ${AppLocalizations.of(context)!
                                .egypt}",
                            style: AppTextStyles.offWhite14Medium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                          Icons.light_mode_outlined, color: AppColors.offWhite),
                      SizedBox(width: width * 0.025),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadiusGeometry.circular(8),
                        ),
                        padding: EdgeInsets.all(0.02 * width),
                        child: Text(
                          AppLocalizations.of(context)!.en,
                          style: AppTextStyles.blue20Bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              DefaultTabController(
                  length: eventNameList.length,
                  child: TabBar(
                      onTap: (index) {
                        selectedIndex = index;
                        setState(() {

                        });
                      },
                      labelPadding: EdgeInsetsDirectional.only(
                          start: 0.025 * width),
                      indicatorColor: AppColors.transparent,
                      dividerColor: AppColors.transparent,
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      tabs: eventNameList.map(
                              (eventName) =>
                              EventTabItem(
                                icon: eventIconsList[eventNameList.indexOf(
                                    eventName)],
                                eventName: eventName,
                                isSelected: (selectedIndex ==
                                    eventNameList.indexOf(eventName)),
                              )
                      ).toList()
                  ))
            ],
          ),
        ),
          body: Container(
            margin: EdgeInsets.only(
                top: height * 0.019
            ),
            height: 0.64 * height,
            child: Expanded(child: ListView.separated(
              itemBuilder: (context, index) {
                return EventItem();
              },
              itemCount: 20,
              separatorBuilder: (context, index) {
                return SizedBox(height: height * 0.019,);
              },
            )
            ),
          )
      ),
    );
  }
}

