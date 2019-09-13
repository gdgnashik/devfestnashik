import 'package:flutter/material.dart';

class SocialModel {
  final Widget icon;
  final Function onClick;
  final String hint;

  SocialModel(
      {@required this.icon, @required this.onClick, @required this.hint});
}
