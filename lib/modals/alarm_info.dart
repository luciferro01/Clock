import 'package:flutter/cupertino.dart';

class AlarmInfo {
  DateTime alarmDateTime;
  String? description;
  bool isActive;
  List<Color>? gradientColors;

  AlarmInfo(this.alarmDateTime, this.isActive,
      {this.description, this.gradientColors});
}
