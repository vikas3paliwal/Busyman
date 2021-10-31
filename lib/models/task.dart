import 'dart:convert';

import 'package:flutter/cupertino.dart';

enum Status { Ongoing, Pending, Upcoming, Completed }

class Task {
  String id;
  String taskName;
  String description;
  String startDate;
  String startTime;
  String endDate;
  String endTime;
  String category;
  List<String> workingFor;
  List<String> allocatedTo;
  bool priority;
  late Status status;
  bool completed;
  Task(
      {required this.id,
      required this.allocatedTo,
      required this.category,
      required this.description,
      required this.endDate,
      required this.endTime,
      required this.priority,
      required this.startDate,
      required this.startTime,
      required this.taskName,
      required this.workingFor,
      required this.completed});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // final jsonworking = jsonEncode(this.workingFor);
    // final jsonallocation = jsonEncode(this.workingFor);
    data['taskName'] = this.taskName;
    data['description'] = this.description;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['category'] = this.category;
    data['priority'] = this.priority;
    data['workingFor'] = workingFor;
    data['allocatedTo'] = allocatedTo;

    return data;
  }
}
