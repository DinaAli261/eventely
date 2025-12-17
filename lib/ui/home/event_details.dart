import 'package:evently/model/event.dart';
import 'package:evently/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/event_list_provider.dart';
import '../../providers/user_provider.dart';
import '../../utils/App_text_styles.dart';
import '../../utils/app_colors.dart';
import 'edit_event.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({super.key});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  late Event event;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final argEvent = ModalRoute
          .of(context)!
          .settings
          .arguments as Event;
      final eventListProvider = Provider.of<EventListProvider>(
          context, listen: false);

      setState(() {
        event = eventListProvider.events.firstWhere(
              (e) => e.id == argEvent.id,
          orElse: () => argEvent,
        );
      });
    });
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
    final eventListProvider = Provider.of<EventListProvider>(context);
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    if (event == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(
          color: AppColors.blue,
        )),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.event_details,
          style: AppTextStyles.blue22Regular,
        ),
        centerTitle: true,
        backgroundColor: AppColors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditEvent(event: event)),
              ).then((_) {
                setState(() {
                  final updatedEvent = eventListProvider.events.firstWhere(
                        (e) => e.id == event.id,
                    orElse: () => event,
                  );
                  event = updatedEvent;
                });
              });
            },
            icon: const Icon(Icons.edit_outlined),
          ),
          IconButton(
            onPressed: () {
              eventListProvider.deleteEvent(event.id);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete_outline),
            color: AppColors.red,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.02,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(event.eventImage),
              ),
              SizedBox(height: height * 0.02),
              Text(event.title, style: AppTextStyles.blue24Medium),
              SizedBox(height: height * 0.02),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.blue),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.blue,
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: width * 0.02,
                        vertical: height * 0.008,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03,
                        vertical: height * 0.013,
                      ),
                      child: const Icon(Icons.calendar_month_outlined,
                          color: AppColors.white),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('d MMMM yyyy').format(event.eventDateTime),
                          style: AppTextStyles.blue16Medium,
                        ),
                        Text(
                          DateFormat('hh:mma').format(event.eventDateTime),
                          style: Theme
                              .of(context)
                              .textTheme
                              .labelMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.blue),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.blue,
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: width * 0.02,
                        vertical: height * 0.008,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03,
                        vertical: height * 0.013,
                      ),
                      child: const Icon(
                          Icons.my_location, color: AppColors.white),
                    ),
                    Text("Cairo , Egypt", style: AppTextStyles.blue16Medium),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              Image.asset(
                AppImages.map,
                width: 0.91 * width,
                height: 0.39 * height,
                fit: BoxFit.fill,
              ),
              SizedBox(height: height * 0.02),
              Text("Description\n${event.description}", style: Theme
                  .of(context)
                  .textTheme
                  .labelMedium),
            ],
          ),
        ),
      ),
    );
  }
}
