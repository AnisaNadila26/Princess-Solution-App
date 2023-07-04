import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:princess_solution/dasbor/komponen_dasbor/content_notifier.dart';
import 'package:provider/provider.dart';

class Content extends StatelessWidget {
  final Function? gantiPage;
  const Content({super.key, this.gantiPage});
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ContentNotifier(context),
      child: Consumer<ContentNotifier>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 120),
              GestureDetector(
                // onTap: () {
                //   setState(() {});
                // },
                child: Card(
                  elevation: 2.0,
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Jadwal'),
                            Icon(MdiIcons.chevronRight),
                          ],
                        ),
                        Text('15 Februari 2023'),
                        Divider(
                          color: Colors.black,
                          thickness: 0.2,
                        ),
                        Text('Tidak ada Jadwal'),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                elevation: 2.0,
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      gantiPage!();
                    },
                    // onTap: () {
                    //   context.go('/pengumuman');
                    // },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Pengumuman'),
                            Icon(MdiIcons.chevronRight),
                          ],
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 0.2,
                        ),
                        Text('Belum ada Pengumuman'),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}