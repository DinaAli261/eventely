import 'package:evently/firebase_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/event.dart';

class EventListProvider extends ChangeNotifier {
  List<Event> _events = [];
  bool _isLoading = false;

  List<Event> get events => _events;

  bool get isLoading => _isLoading;

  Future<void> loadEvents() async {
    final String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      _events = [];
      notifyListeners();
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      _events = await FirebaseUtils.getEventsForUser(userId);
    } catch (e) {
      print('Error loading events: $e');
      _events = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addEvent(Event event) async {
    final String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    await FirebaseUtils.addEventToFireStore(event, userId);
    _events.add(event);
    notifyListeners();
  }

  Future<void> deleteEvent(String eventId) async {
    final String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    await FirebaseUtils.deleteEventFromFireStore(eventId, userId);
    _events.removeWhere((event) => event.id == eventId);
    notifyListeners();
  }

  void toggleFavorite(String eventId) {
    int index = _events.indexWhere((e) => e.id == eventId);
    if (index != -1) {
      _events[index].isFavorite = !_events[index].isFavorite;
      notifyListeners();
    }
  }

  void clearEvents() {
    _events = [];
    notifyListeners();
  }
}
