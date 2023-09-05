import 'package:flutter/material.dart';

class OnboardingModel extends StatelessWidget {
  final String title;
  final String description;
  final Image image;

  const OnboardingModel(
      {super.key,
      required this.title,
      required this.description,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          width: 0.0,
          color: Colors.transparent,
        ),
      ),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45.0,
                vertical: 50.0,
              ),
              child: image,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(title, textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.w600),),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
              child: Align(
                  alignment: Alignment.centerLeft, child: Text(description, textAlign: TextAlign.left,)),
            ),
          ],
        ),
      ),
    );
  }
}
