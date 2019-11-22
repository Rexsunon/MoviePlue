import 'package:flutter/widgets.dart';

class BottomNavBarItem {
  final Icon icon;
  final Text title;
  final Color activeColor;
  final Color inactiveColor;

  BottomNavBarItem({this.icon, this.title, this.activeColor, this.inactiveColor});
}