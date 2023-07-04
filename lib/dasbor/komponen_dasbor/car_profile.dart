import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class CarProfil extends StatefulWidget {
  const CarProfil({super.key});

  @override
  State<CarProfil> createState() => _CarProfilState();
}

class _CarProfilState extends State<CarProfil> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 320,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(15)),
      child: Column(children: [
        Image.asset(
          'assets/mobil.png',
          width: 250,
          fit: BoxFit.cover,
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('NAS'),
              VerticalDivider(
                color: Colors.black,
                thickness: 0.2,
              ),
              Text('Suhadi'),
            ],
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Icon(MdiIcons.steering, size: 20),
            Text('Manual'),
            Spacer(),
            Icon(MdiIcons.clipboardList, size: 20),
            Text('Paket A'),
            Spacer(),
            Icon(MdiIcons.clockTimeEight, size: 20),
            Text('10.00-11.00'),
            Spacer(),
          ],
        ),
      ]),
    );
  }
}