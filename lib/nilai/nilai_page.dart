import 'package:flutter/material.dart';
import 'package:princess_solution/nilai/nilai_notifier.dart';
import 'package:provider/provider.dart';

class NilaiPage extends StatelessWidget {
  const NilaiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => NilaiNotifier(context),
        child: Consumer<NilaiNotifier>(
          builder: (context, value, child) => Scaffold(
            appBar: AppBar(
              title: Text(
                'Penilaian',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.black,
            ),
            body: SafeArea(
                child: Column(
              children: [
                value.tabButton(),
                Expanded(
                    child: value.isLoading
                        ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : value.currentTabIndex == 0
                          ? value.buildSiswaList(value.siswaListManual)
                          : value.buildSiswaList(value.siswaListMatic),
                ),
              ],
            )),
          ),
        ));
  }
}
