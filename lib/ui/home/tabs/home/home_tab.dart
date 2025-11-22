import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/event_list_provider.dart';
import 'package:evently/ui/home/tabs/home/widget/event_item.dart';
import 'package:evently/ui/home/tabs/home/widget/event_tab_item.dart';
import 'package:evently/utils/App_text_styles.dart';
import 'package:evently/utils/app_images.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_colors.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var eventListProvider = Provider.of<EventListProvider>(context);
    if (eventListProvider.eventsList.isEmpty) {
      eventListProvider.getAllEvents();
    }
    eventListProvider.getEventNameList(context);
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
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleSmall,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              DefaultTabController(
                  length: eventListProvider.eventNameList.length,
                  child: TabBar(
                      onTap: (index) {
                        eventListProvider.changeSelectedIndex(index);
                      },
                      labelPadding: EdgeInsetsDirectional.only(
                          start: 0.025 * width),
                      indicatorColor: AppColors.transparent,
                      dividerColor: AppColors.transparent,
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      tabs: eventListProvider.eventNameList.map(
                              (eventName) =>
                              EventTabItem(
                                icon: eventIconsList[eventListProvider
                                    .eventNameList.indexOf(
                                    eventName)],
                                eventName: eventName,
                                isSelected: (eventListProvider.selectedIndex ==
                                    eventListProvider.eventNameList.indexOf(
                                        eventName)),
                                selectedBgColor: Theme
                                    .of(context)
                                    .focusColor,
                                borderColor: Theme
                                    .of(context)
                                    .focusColor,
                                selectedTextStyle: Theme
                                    .of(context)
                                    .textTheme
                                    .headlineMedium,
                                unSelectedTextStyle: AppTextStyles
                                    .offWhite16Medium,
                                selectedIconColor: Theme
                                    .of(context)
                                    .secondaryHeaderColor,
                                unSelectedIconColor: AppColors.offWhite,
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
            child: eventListProvider.filterEventList.isEmpty ?
            Center(child: Text(AppLocalizations.of(context)!.no_event_found,
              style: AppTextStyles.blue20Medium,))
                : ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.eventDetailsRouteName,
                      arguments: eventListProvider.filterEventList[index],
                    );
                  },
                  child: EventItem(
                    event: eventListProvider.filterEventList [index],),
                );
              },
              itemCount: eventListProvider.filterEventList.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: height * 0.019,);
              },
            ),
          )
      ),
    );
  }

}

