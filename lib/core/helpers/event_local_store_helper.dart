import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/event_model.dart';

class EventStorageHelper {
  static Future<void> saveEvent(Event event) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedEvents = prefs.getStringList('events') ?? [];

    String eventJson = jsonEncode(event.toJson());
    savedEvents.add(eventJson);

    await prefs.setStringList('events', savedEvents);
  }

  static Future<void> removeEvent(int eventId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedEvents = prefs.getStringList('events') ?? [];

    List<Event> events =
        savedEvents.map((event) => Event.fromJson(jsonDecode(event))).toList();

    events.removeWhere((event) => event.eventId == eventId);

    List<String> updatedEvents =
        events.map((event) => jsonEncode(event.toJson())).toList();
    await prefs.setStringList('events', updatedEvents);
  }

  static Future<bool> isEventSaved(int eventId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedEvents = prefs.getStringList('events') ?? [];

    for (String eventJson in savedEvents) {
      Event event = Event.fromJson(jsonDecode(eventJson));
      if (event.eventId == eventId) {
        return true;
      }
    }
    return false;
  }

  static Future<List<Event>> getSavedEvents() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedEvents = prefs.getStringList('events') ?? [];

    var events =
        savedEvents.map((event) => Event.fromJson(jsonDecode(event))).toList();
    print(events.length);
    return events;
  }
}
