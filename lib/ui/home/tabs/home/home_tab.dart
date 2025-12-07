import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/event_list_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/ui/home/tabs/home/widget/event_item.dart';
import 'package:evently/ui/home/tabs/home/widget/event_tab_item.dart';
import 'package:evently/utils/App_text_styles.dart';
import 'package:evently/utils/app_images.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/event.dart';
import '../../../../utils/app_colors.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;

  List<String> eventNames = [
    "All",
    "Sport",
    "Birthday",
    "Book Club",
    "Meeting",
    "Gaming",
    "Workshop",
    "Holiday",
    "Food",
  ];

  List<IconData> eventIconsList = [
    Icons.explore_outlined,
    Icons.directions_bike_outlined,
    Icons.cake_outlined,
    Icons.menu_book_outlined,
    Icons.groups_outlined,
    Icons.sports_esports_outlined,
    Icons.computer,
    Icons.beach_access_outlined,
    Icons.fastfood_outlined,
  ];

  @override
  void initState() {
    super.initState();
    Provider.of<EventListProvider>(context, listen: false).loadEvents();
  }

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

    // فلترة الإيفنتس حسب التاب المختار
    List<Event> filteredEvents;
    if (selectedIndex == 0) {
      filteredEvents = eventListProvider.events;
    } else {
      String selectedCategory = eventNames[selectedIndex];
      filteredEvents = eventListProvider.events
          .where((event) => event.eventName == selectedCategory)
          .toList();
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          toolbarHeight: 0.20 * height,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
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
                        Provider
                            .of<UserProvider>(context)
                            .currentUser!
                            .name,
                        style: AppTextStyles.offWhite24Bold,
                      ),
                      SizedBox(height: 0.009 * height),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ImageIcon(
                            AssetImage(AppImages.unselectedMap),
                            color: AppColors.offWhite,
                          ),
                          Text(
                            "${AppLocalizations.of(context)!.cairo} ,"
                                " ${AppLocalizations.of(context)!.egypt}",
                            style: AppTextStyles.offWhite14Medium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.light_mode_outlined,
                          color: AppColors.offWhite),
                      SizedBox(width: width * 0.025),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8),
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
                length: eventNames.length,
                child: TabBar(
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  labelPadding:
                  EdgeInsetsDirectional.only(start: 0.025 * width),
                  indicatorColor: AppColors.transparent,
                  dividerColor: AppColors.transparent,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  tabs: eventNames.map(
                        (eventName) {
                      int idx = eventNames.indexOf(eventName);
                      return EventTabItem(
                        icon: eventIconsList[idx % eventIconsList.length],
                        eventName: eventName,
                        isSelected: selectedIndex == idx,
                        selectedBgColor: Theme
                            .of(context)
                            .focusColor,
                        borderColor: Theme
                            .of(context)
                            .focusColor,
                        selectedTextStyle:
                        Theme
                            .of(context)
                            .textTheme
                            .headlineMedium,
                        unSelectedTextStyle:
                        AppTextStyles.offWhite16Medium,
                        selectedIconColor:
                        Theme
                            .of(context)
                            .secondaryHeaderColor,
                        unSelectedIconColor: AppColors.offWhite,
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: height * 0.019),
          height: 0.64 * height,
          child: filteredEvents.isEmpty
              ? Center(
            child: Text(
              AppLocalizations.of(context)!.no_event_found,
              style: AppTextStyles.blue20Medium,
            ),
          )
              : ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.eventDetailsRouteName,
                    arguments: filteredEvents[index],
                  );
                },
                child: EventItem(
                  event: filteredEvents[index],
                ),
              );
            },
            itemCount: filteredEvents.length,
            separatorBuilder: (context, index) {
              return SizedBox(height: height * 0.019);
            },
          ),
        ),
      ),
    );
  }
}
