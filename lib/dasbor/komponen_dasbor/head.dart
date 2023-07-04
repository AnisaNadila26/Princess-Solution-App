import 'package:flutter/material.dart';

class Head extends StatelessWidget {
  final double headHeight = 240;
  final double profilHeight = 123;

  const Head({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: headHeight,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 20,
                    child: Text(
                      'Dasbor', style: TextStyle(color: Colors.white),
                      // style: GoogleFonts.openSans(
                      //     textStyle: Theme.of(context).textTheme.bodyMedium),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}