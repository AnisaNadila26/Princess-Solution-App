import 'package:flutter/material.dart';
import 'head.dart';
import 'car_profile.dart';

class Top extends StatefulWidget {

  const Top({super.key});

  @override
  State<Top> createState() => _TopState();
}

class _TopState extends State<Top> {
  final double headHeight = 240;

  final double profilHeight = 123;

  @override
  Widget build(BuildContext context) {
    final top = headHeight - profilHeight / 2;
    final bottom = profilHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(margin: EdgeInsets.only(bottom: bottom), child: Head()),
        Positioned(top: top, child: CarProfil())
      ],
    );
  }
}