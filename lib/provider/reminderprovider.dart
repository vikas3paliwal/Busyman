import 'dart:convert';

import 'package:busyman/models/reminder.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class Reminderprovider extends ChangeNotifier {
  List<Reminder> _reminders = [];
  List<Reminder> get reminders {
    return [..._reminders];
  }

  Future<void> addReminder(Reminder reminder) async {
    try {
      final ref = await FirebaseDatabase.instance
          .reference()
          .child('Users/641Wbl9iOLe09ecDYKG7qUKtfz92/Reminders/');
      final ref2 = await ref.push().get();
      ref.child(ref2.key.toString()).set(reminder.toJson());
      reminder.id = ref2.key!;

      _reminders.add(reminder);
      notifyListeners();
    } catch (e) {}
  }

  Future<void> deleteReminder(String id) async {
    try {
      await FirebaseDatabase.instance
          .reference()
          .child('Users/641Wbl9iOLe09ecDYKG7qUKtfz92/Reminders/$id')
          .remove();
      _reminders.removeWhere((element) => element.id == id);
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> editReminder(Reminder reminder) async {
    try {
      await FirebaseDatabase.instance
          .reference()
          .child('Users/641Wbl9iOLe09ecDYKG7qUKtfz92/Reminders/${reminder.id}')
          .update(reminder.toJson());
      int index = _reminders.indexWhere((element) => element.id == reminder.id);
      _reminders[index] = reminder;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchReminders() async {
    if (_reminders.isEmpty) {
      final tasks = await FirebaseDatabase.instance
          .reference()
          .child('Users/641Wbl9iOLe09ecDYKG7qUKtfz92/Reminders/')
          .get();
      print(tasks.value);
      final string = jsonEncode(tasks.value);
      final Map<String, dynamic> data = jsonDecode(string);
      for (int i = 0; i < data.keys.length; i++) {
        Reminder task = Reminder(
          id: data.keys.toList()[i],
          reminderName: data.values.toList()[i]['reminderName'],
          date: data.values.toList()[i]['date'],
          time: data.values.toList()[i]['time'],
          category: data.values.toList()[i]['category'],
        );

        _reminders.add(task);
      }
    }
  }

  Reminder findReminder(String id) {
    return _reminders.firstWhere((element) => element.id == id);
  }
}
