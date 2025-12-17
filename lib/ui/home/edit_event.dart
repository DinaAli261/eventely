import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/model/event.dart';
import 'package:evently/ui/home/add_event/widget/date_or_time_widget.dart';
import 'package:evently/ui/home/tabs/home/widget/event_tab_item.dart';
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

class EditEvent extends StatefulWidget {
  final Event event;

  const EditEvent({super.key, required this.event});

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  int selectedIndex = 0;

  late String selectedEventImage;
  late String selectedEventName;

  late TextEditingController titleController;
  late TextEditingController descriptionController;

  final formKey = GlobalKey<FormState>();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String formatTime = '';

  late EventListProvider eventListProvider;
  late UserProvider userProvider;

  final List<String> eventNameKeys = [
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

  final List<String> eventImages = [
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

  @override
  void initState() {
    super.initState();

    final event = widget.event;

    titleController = TextEditingController(text: event.title);
    descriptionController = TextEditingController(text: event.description);

    selectedDate = event.eventDateTime;
    selectedTime = TimeOfDay.fromDateTime(event.eventDateTime);
    formatTime = event.eventTime;

    selectedIndex = eventNameKeys.indexOf(event.eventName);
    selectedEventImage = event.eventImage;
    selectedEventName = event.eventName;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    eventListProvider = context.read<EventListProvider>();
    userProvider = context.read<UserProvider>();

    final eventNameList = [
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

    final eventIconsList = [
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

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Event", style: AppTextStyles.blue22Regular),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                  child: Image.asset(selectedEventImage),
                ),

                DefaultTabController(
                  length: eventNameList.length,
                  initialIndex: selectedIndex,
                  child: TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                        selectedEventImage = eventImages[index];
                        selectedEventName = eventNameKeys[index];
                      });
                    },
                    tabs: List.generate(
                      eventNameList.length,
                      (index) => EventTabItem(
                        icon: eventIconsList[index],
                        eventName: eventNameList[index],
                        isSelected: selectedIndex == index,
                        selectedBgColor: AppColors.blue,
                        borderColor: AppColors.blue,
                        selectedTextStyle: Theme.of(
                          context,
                        ).textTheme.labelSmall,
                        unSelectedTextStyle: AppTextStyles.blue16Medium,
                        selectedIconColor: Theme.of(context).canvasColor,
                        unSelectedIconColor: AppColors.blue,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.02),

                Text(
                  AppLocalizations.of(context)!.title,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(height: height * 0.01),
                CustomTextFormField(
                  controller: titleController,
                  prefixIcon: Icons.border_color_outlined,
                  hintText: AppLocalizations.of(context)!.event_title,
                ),

                SizedBox(height: height * 0.02),

                Text(
                  AppLocalizations.of(context)!.description,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(height: height * 0.01),
                CustomTextFormField(
                  controller: descriptionController,
                  maxLines: 3,
                  hintText: AppLocalizations.of(context)!.event_description,
                ),

                DateOrTimeWidget(
                  iconName: Icons.calendar_month_outlined,
                  rowText: AppLocalizations.of(context)!.event_date,
                  rowTextButton: selectedDate == null
                      ? AppLocalizations.of(context)!.choose_date
                      : DateFormat('dd/MM/yyyy').format(selectedDate!),
                  onPressed: onChooseDate,
                ),

                DateOrTimeWidget(
                  iconName: Icons.access_time,
                  rowText: AppLocalizations.of(context)!.event_time,
                  rowTextButton: selectedTime == null
                      ? AppLocalizations.of(context)!.choose_time
                      : selectedTime!.format(context),
                  onPressed: onChooseTime,
                ),

                SizedBox(height: height * 0.03),

                CustomElevatedButton(
                  text: "Update Event",
                  onPressed: updateEvent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onChooseDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> onChooseTime() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
        formatTime = pickedTime.format(context);
      });
    }
  }

  void updateEvent() {
    if (!formKey.currentState!.validate() ||
        selectedDate == null ||
        selectedTime == null)
      return;

    final updatedEvent = Event(
      id: widget.event.id,
      title: titleController.text,
      description: descriptionController.text,
      eventImage: selectedEventImage,
      eventName: selectedEventName,
      eventDateTime: selectedDate!,
      eventTime: formatTime,
    );

    eventListProvider.updateEvent(updatedEvent).then((_) {
      ToastUtils.showToastMsg(
        msg: AppLocalizations.of(context)!.event_updated_successfully,
        color: Theme.of(context).canvasColor,
      );
      Navigator.pop(context);
    });
  }
}
