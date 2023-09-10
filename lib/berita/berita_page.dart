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
            child: value.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : value.listBerita.isEmpty
                    ? Center(
                        child: Text(
                          'Belum ada berita',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      )
                    : ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return BeritaItem(berita: value.listBerita[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) => 
                        Divider(
                          color: Theme.of(context).dividerColor,
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
