import 'dart:convert';

import 'package:busyman/models/task.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> get tasks {
    return [..._tasks];
  }

  List<Task> get ongoingtasks {
    return _tasks.where((element) => element.status == Status.Ongoing).toList();
  }

  List<Task> get pendingtasks {
    return _tasks.where((element) => element.status == Status.Pending).toList();
  }

  List<Task> get upcomingtasks {
    return _tasks
        .where((element) => element.status == Status.Upcoming)
        .toList();
  }

  List<Task> get completedtasks {
    return _tasks
        .where((element) => element.status == Status.Completed)
        .toList();
  }

  Future<void> addNewTask(Task task) async {
    try {
      final ref = await FirebaseDatabase.instance
          .reference()
          .child('Users/641Wbl9iOLe09ecDYKG7qUKtfz92/Tasks/');
      final ref2 = await ref.push().get();
      ref.child(ref2.key.toString()).set(task.toJson());
      task.id = ref2.key!;
      statusUpdate(task);
      _tasks.add(task);
      notifyListeners();
    } catch (e) {
      print('error occured in line 15 task provider');
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      await FirebaseDatabase.instance
          .reference()
          .child('Users/641Wbl9iOLe09ecDYKG7qUKtfz92/Tasks/$id')
          .remove();
      _tasks.removeWhere((element) => element.id == id);
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> editTask(Task task) async {
    try {
      await FirebaseDatabase.instance
          .reference()
          .child('Users/641Wbl9iOLe09ecDYKG7qUKtfz92/Tasks/${task.id}')
          .update(task.toJson());
      int index = _tasks.indexWhere((element) => element.id == task.id);
      _tasks[index] = task;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchTasks() async {
    if (_tasks.isEmpty) {
      final tasks = await FirebaseDatabase.instance
          .reference()
          .child('Users/641Wbl9iOLe09ecDYKG7qUKtfz92/Tasks/')
          .get();
      print(tasks.value);
      final string = jsonEncode(tasks.value);
      final Map<String, dynamic> data = jsonDecode(string);
      for (int i = 0; i < data.keys.length; i++) {
        Task task = Task(
            id: data.keys.toList()[i],
            taskName: data.values.toList()[i]['taskName'],
            description: data.values.toList()[i]['description'],
            startDate: data.values.toList()[i]['startDate'],
            startTime: data.values.toList()[i]['startTime'],
            endDate: data.values.toList()[i]['endDate'],
            endTime: data.values.toList()[i]['endTime'],
            priority: data.values.toList()[i]['priority'],
            workingFor: data.values.toList()[i]['workingFor'] != null
                ? data.values
                    .toList()[i]['workingFor']
                    .map<String>((e) => e.toString())
                    .toList()
                : [],
            allocatedTo: data.values.toList()[i]['allocatedTo'] != null
                ? data.values
                    .toList()[i]['allocatedTo']
                    .map<String>((e) => e.toString())
                    .toList()
                : [],
            category: data.values.toList()[i]['category'],
            completed: data.values.toList()[i]['completed'] ?? false);
        statusUpdate(task);

        _tasks.add(task);
      }
    }
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  Task findTask(String id) {
    return _tasks.firstWhere((element) => element.id == id);
  }

  List<Task> findListByStatus(Status status) {
    List<Task> list = [];
    if (status == Status.Ongoing) {
      list = ongoingtasks;
    } else if (status == Status.Pending) {
      list = pendingtasks;
    } else if (status == Status.Completed) {
      list = completedtasks;
    } else if (status == Status.Upcoming) {
      list = upcomingtasks;
    }
    return list;
  }

  void statusUpdate(Task task) {
    DateTime startDate =
        DateFormat('dd MMM, yyyy').parse(task.startDate.toString());
    DateTime endDate =
        DateFormat('dd MMM, yyyy').parse(task.endDate.toString());

    int diffbetstartandtoday = daysBetween(DateTime.now(), startDate);
    int diffbetendandtoday = daysBetween(DateTime.now(), endDate);

    if (diffbetstartandtoday > 0 && task.completed == false) {
      task.status = Status.Upcoming;
    } else if (diffbetstartandtoday <= 0 &&
        diffbetendandtoday >= 0 &&
        task.completed == false) {
      task.status = Status.Ongoing;
    } else if (diffbetendandtoday < 0 && task.completed == false) {
      task.status = Status.Pending;
    } else if (task.completed == true) {
      task.status = Status.Completed;
    }
  }
}
