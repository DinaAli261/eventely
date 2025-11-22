import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/utils/toast_utils.dart';
import 'package:flutter/material.dart';

import '../firebase_utils.dart';
import '../l10n/app_localizations.dart';
import '../model/event.dart';
class EventListProvider extends ChangeNotifier {
  int selectedIndex = 0;
  List<Event> eventsList = [];
  List<Event> filterEventList = [];
  List<String> eventNameList = [];
  List<Event> favoriteList = [];

  List<String> getEventNameList(BuildContext context) {
    return eventNameList = [
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
  }

  Future<void> getAllEvents() async {
    QuerySnapshot<Event> querySnapshot =
        await FirebaseUtils.getEventCollection().get();
    eventsList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    filterEventList = eventsList; //all events
    //sorting
    filterEventList.sort((event1, event2) {
      return event1.eventDateTime.compareTo(event2.eventDateTime);
    });
    notifyListeners();
  }

  Future<void> getFilterEvents() async {
    //getting all events
    QuerySnapshot<Event> querySnapshot =
        await FirebaseUtils.getEventCollection().get();
    eventsList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    //filtering
    filterEventList = eventsList.where((event) {
      return event.eventName == eventNameList[selectedIndex];
    }).toList();
    //sorting
    filterEventList.sort((event1, event2) {
      return event1.eventDateTime.compareTo(event2.eventDateTime);
    });
    notifyListeners();
  }

  void changeSelectedIndex(int newSelectedIndex) {
    selectedIndex = newSelectedIndex;
    selectedIndex == 0 ? getAllEvents() : getFilterEvents();
  }

  void getALLFavoriteEvents() async {
    QuerySnapshot<Event> querySnapshot =
        await FirebaseUtils.getEventCollection().get();
    eventsList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    favoriteList = eventsList.where((event) {
      return event.isFavorite == true;
    }).toList();
    favoriteList.sort((event1, event2) {
      return event1.eventDateTime.compareTo(event2.eventDateTime);
    });
    notifyListeners();
  }

  void updateIsFavoriteEvent(Event event, BuildContext context) {
    FirebaseUtils.getEventCollection()
        .doc(event.id)
        .update({'isFavorite': !event.isFavorite})
        .timeout(
          Duration(seconds: 1),
          onTimeout: () {
            ToastUtils.showToastMsg(
              msg: AppLocalizations.of(context)!.event_updated_successfully,
              color: Theme.of(context).canvasColor,
            );
          },
        );
    selectedIndex == 0 ? getAllEvents() : getFilterEvents();
    getALLFavoriteEvents();
    notifyListeners();
  }

  void deleteEvent(Event event, BuildContext context) async {
    try {
      await FirebaseUtils.getEventCollection().doc(event.id).delete();

      eventsList.removeWhere((e) => e.id == event.id);
      filterEventList.removeWhere((e) => e.id == event.id);
      favoriteList.removeWhere((e) => e.id == event.id);

      notifyListeners();

      ToastUtils.showToastMsg(
        msg: AppLocalizations.of(context)!.event_deleted_successfully,
        color: Colors.green,
      );
    } catch (e) {
      ToastUtils.showToastMsg(
        msg: AppLocalizations.of(context)!.some_thing_went_wrong,
        color: Colors.red,
      );
      print("Error deleting event: $e");
    }
  }
}
