import 'package:flutter/material.dart';

class EventModel {
  final Widget icon;
  final Function onClick;
  final String text;

  EventModel(
      {@required this.icon, @required this.onClick, @required this.text});
}
