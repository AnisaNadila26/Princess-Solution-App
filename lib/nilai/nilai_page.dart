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
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(12, 15, 39, 1.0),
                      Color.fromRGBO(76, 105, 176, 1.0),
                    ],
                  ),
                ),
              ),
              centerTitle: true,
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
