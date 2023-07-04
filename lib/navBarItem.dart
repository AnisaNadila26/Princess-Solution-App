import 'package:flutter/material.dart';

class ScaffoldWithBottomNavBar extends BottomNavigationBarItem {
  const ScaffoldWithBottomNavBar(
      {required this.initialLocation, required Widget icon, String? label})
      : super(icon: icon, label: label);

  final String initialLocation;
}