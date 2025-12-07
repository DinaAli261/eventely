import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/model/event.dart';
import 'package:evently/ui/home/add_event/widget/date_or_time_widget.dart';
import 'package:evently/ui/home/widget/custom_elevated_button.dart';
import 'package:evently/ui/home/widget/custom_text_form_field.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_images.dart';
import 'package:evently/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../providers/event_list_provider.dart';
import '../../../providers/user_provider.dart';
import '../../../utils/App_text_styles.dart';
import '../tabs/home/widget/event_tab_item.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  int selectedIndex = 0;
  String selectedEventImage = '';
  String selectedEventName = '';
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  bool isSelectedDate = true;
  bool isSelectedTime = true;
  String formatTime = '';

  late EventListProvider eventListProvider;
  late UserProvider userProvider;

  List<String> eventNameKeys = [
    'Sport',
    'Birthday',
    'Meeting',
    'Gaming',
    'Workshop',
    'BookClub',
    'Exhibition',
    'Holiday',
    'Eating',
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    eventListProvider = Provider.of<EventListProvider>(context);
    userProvider = Provider.of<UserProvider>(context);

    List<String> eventNameList = [
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

    List<String> eventImages = [
      AppImages.sport,
      AppImages.birthday,
      AppImages.meeting,
      AppImages.gaming,
      AppImages.workshop,
      AppImages.bookClub,
      AppImages.exhibition,
      AppImages.holiday,
      AppImages.eating,
    ];

    selectedEventImage = eventImages[selectedIndex];
    selectedEventName = eventNameKeys[selectedIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.create_event,
          style: AppTextStyles.blue22Regular,
        ),
        centerTitle: true,
        backgroundColor: AppColors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.02,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(eventImages[selectedIndex]),
                ),
                DefaultTabController(
                  length: eventNameList.length,
                  initialIndex: 0,
                  child: TabBar(
                    onTap: (index) {
                      selectedIndex = index;
                      selectedEventImage = eventImages[index];
                      selectedEventName = eventNameKeys[index];
                      setState(() {});
                    },
                    labelPadding: EdgeInsetsDirectional.only(
                      start: 0.025 * width,
                    ),
                    indicatorColor: AppColors.transparent,
                    dividerColor: AppColors.transparent,
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    tabs: eventNameList
                        .map(
                          (eventName) => EventTabItem(
                            icon:
                            eventIconsList[eventNameList.indexOf(eventName)],
                            eventName: eventName,
                            isSelected: (selectedIndex ==
                                eventNameList.indexOf(eventName)),
                            selectedBgColor: AppColors.blue,
                            borderColor: AppColors.blue,
                            selectedTextStyle:
                            Theme
                                .of(context)
                                .textTheme
                                .labelSmall,
                            unSelectedTextStyle: AppTextStyles.blue16Medium,
                            selectedIconColor: Theme
                                .of(context)
                                .canvasColor,
                            unSelectedIconColor: AppColors.blue,
                          ),
                    )
                        .toList(),
                  ),
                ),
                SizedBox(height: height * 0.02),
                Text(
                  AppLocalizations.of(context)!.title,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(height: height * 0.02),
                CustomTextFormField(
                  controller: titleController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return AppLocalizations.of(context)!.please_enter_title;
                    }
                    return null;
                  },
                  prefixIcon: Icons.border_color_outlined,
                  hintText: AppLocalizations.of(context)!.event_title,
                ),
                SizedBox(height: height * 0.02),
                Text(
                  AppLocalizations.of(context)!.description,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(height: height * 0.02),
                CustomTextFormField(
                  controller: descriptionController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return AppLocalizations.of(context)!
                          .please_enter_description;
                    }
                    return null;
                  },
                  maxLines: 3,
                  hintText: AppLocalizations.of(context)!.event_description,
                ),
                DateOrTimeWidget(
                  iconName: Icons.calendar_month_outlined,
                  rowText: AppLocalizations.of(context)!.event_date,
                  rowTextButton: (selectedDate == null)
                      ? AppLocalizations.of(context)!.choose_date
                      : formatTime =
                      DateFormat('dd/MM/yyyy').format(selectedDate!),
                  onPressed: onChooseDate,
                ),
                if (!isSelectedDate)
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      AppLocalizations.of(context)!.please_choose_date,
                      style: AppTextStyles.red12Regular,
                    ),
                  ),
                DateOrTimeWidget(
                  iconName: Icons.access_time,
                  rowText: AppLocalizations.of(context)!.event_time,
                  rowTextButton: (selectedTime == null)
                      ? AppLocalizations.of(context)!.choose_time
                      : selectedTime!.format(context),
                  onPressed: onChooseTime,
                ),
                if (!isSelectedTime)
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      AppLocalizations.of(context)!.please_choose_time,
                      style: AppTextStyles.red12Regular,
                    ),
                  ),
                SizedBox(height: height * 0.02),
                CustomElevatedButton(
                  onPressed: addEvent,
                  text: AppLocalizations.of(context)!.add_event,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onChooseDate() async {
    var chooseDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    selectedDate = chooseDate;
    setState(() {});
  }

  Future<void> onChooseTime() async {
    var chooseTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    selectedTime = chooseTime;
    formatTime = selectedTime!.format(context);
    setState(() {});
  }

  void addEvent() {
    isSelectedDate = (selectedDate != null);
    isSelectedTime = (selectedTime != null);

    if (formKey.currentState?.validate() == true &&
        selectedDate != null &&
        selectedTime != null) {
      Event event = Event(
        title: titleController.text,
        description: descriptionController.text,
        eventImage: selectedEventImage,
        eventName: selectedEventName,
        eventDateTime: selectedDate!,
        eventTime: formatTime,
      );

      eventListProvider.addEvent(event).then((_) {
        ToastUtils.showToastMsg(
          msg: AppLocalizations.of(context)!.event_added_successfully,
          color: Theme
              .of(context)
              .canvasColor,
        );
        Navigator.pop(context);
      }).catchError((e) {
        ToastUtils.showToastMsg(
          msg: AppLocalizations.of(context)!.some_thing_went_wrong,
          color: Colors.red,
        );
        print("Error adding event: $e");
      });

      setState(() {});
    }
  }
}
