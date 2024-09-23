import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unicornect/app/models/User.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final dateFormatter = DateFormat('EEE. MMM d');
class Event{
  Event(this.image, this.title, this.date, this.time, this.attendants):id=uuid.v4();
  final String id;
  final String image;
  final String title;
  final DateTime date;
  final TimeOfDay time;
  final List<User> attendants;

  String get getFormattedDate{
    return dateFormatter.format(date).toUpperCase();
  }

  String getFormattedTime(BuildContext context){
    return time.format(context);
  }
}