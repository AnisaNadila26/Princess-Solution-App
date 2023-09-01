import 'package:flutter/material.dart';
import 'package:princess_solution/berita/berita_notifier.dart';
import 'package:princess_solution/berita/berita_item.dart';
import 'package:provider/provider.dart';

class BeritaPage extends StatelessWidget {
  const BeritaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BeritaNotifier(context),
      child: Consumer<BeritaNotifier>(
        builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            title: Text(
              'Berita',
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
            child: value.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : value.listBerita.isEmpty
                    ? Center(
                        child: Text('Belum ada berita'),
                      )
                    : ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return BeritaItem(berita: value.listBerita[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(
                          color: Colors.black,
                          thickness: 0.2,
                        ),
                        itemCount: value.listBerita.length,
                      ),
          ),
        ),
      ),
    );
  }
}
