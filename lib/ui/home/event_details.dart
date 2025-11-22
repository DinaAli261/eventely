import 'package:evently/model/event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/event_list_provider.dart';
import '../../utils/App_text_styles.dart';
import '../../utils/app_colors.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final event = ModalRoute.of(context)!.settings.arguments as Event;
    final eventListProvider = Provider.of<EventListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.event_details,
          style: AppTextStyles.blue22Regular,
        ),
        centerTitle: true,
        backgroundColor: AppColors.transparent,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.edit_outlined)),
          IconButton(
            onPressed: () {
              eventListProvider.deleteEvent(event, context);
              Navigator.pop(context);
            },
            icon: Icon(Icons.delete_outline),
            color: AppColors.red,
          ),
        ],
      ),
    );
  }
}
