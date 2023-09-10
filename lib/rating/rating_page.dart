import 'package:flutter/material.dart';
import 'package:princess_solution/rating/rating_notifier.dart';
import 'package:provider/provider.dart';
import 'package:princess_solution/network/network.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingPage extends StatelessWidget {
  const RatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => RatingNotifier(context),
        child: Consumer<RatingNotifier>(
          builder: (context, value, child) => Scaffold(
            appBar: AppBar(
              title: Text(
                'Penilaian Kursus',
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
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(MdiIcons.keyboardBackspace),
              ),
            ),
            body: SafeArea(
                child: value.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView(children: [
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: SizedBox(
                                height: 250,
                                child: value.users!.rating! == ''
                                    ? Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        elevation: 2.0,
                                        child: Center(
                                          child: Text(
                                            'Anda belum memberikan ulasan',
                                            style: Theme.of(context).textTheme.bodyMedium,
                                          ),
                                        ))
                                    : Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)
                                        ),
                                        elevation: 2.0,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 25,
                                                    backgroundColor:
                                                        Colors.grey.shade800,
                                                    child: ClipOval(
                                                      child: Image.network(
                                                        value.users!.fotoProfil!
                                                                .isNotEmpty
                                                            ? NetworkURL
                                                                .getProfilSiswa(
                                                                    value.users!
                                                                        .fotoProfil!)
                                                            : 'assets/defaultProfile.png',
                                                        width: 50,
                                                        height: 50,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 20),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          value.users!.nama!,
                                                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                            fontWeight: FontWeight.bold
                                                          ),
                                                        ),
                                                        SizedBox(height: 5),
                                                        RichText(
                                                          text: TextSpan(
                                                            text: 'Instruktur: ',
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                            ),
                                                            children: <TextSpan>[
                                                              TextSpan(
                                                                text: value.users!.namaInstruktur!,
                                                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                                  fontWeight: FontWeight.bold
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: 5),
                                                        RichText(
                                                          text: TextSpan(
                                                            text: 'Kendaraan: ',
                                                            style: TextStyle(
                                                              color: Colors.white
                                                            ),
                                                            children: <TextSpan>[
                                                              TextSpan(
                                                                text: value.users!.kodeKendaraan!,
                                                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                                  fontWeight: FontWeight.bold
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(
                                                        left: 20, right: 15
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              RatingBar.builder(
                                                                ignoreGestures: true,
                                                                initialRating: double.parse(value.users!.rating!),
                                                                minRating: 1,
                                                                direction: Axis.horizontal,
                                                                allowHalfRating: true,
                                                                itemCount: 5,
                                                                itemSize: 20,
                                                                itemPadding: EdgeInsets.symmetric(
                                                                  horizontal: 4
                                                                ),
                                                                itemBuilder: (context, index) {
                                                                  return value.emoticonForIndex(index);
                                                                },
                                                                onRatingUpdate:(rating) {}),
                                                              SizedBox(width: 10),
                                                              Text(
                                                                value.users!.rating!,
                                                                style: Theme.of(context).textTheme.bodyMedium,
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 5),
                                                          Text(
                                                            value.users!.review!,
                                                            textAlign: TextAlign.justify,
                                                            style: Theme.of(context).textTheme.bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                            ),
                            SizedBox(
                              height: 250,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  color: Colors.transparent,
                                  elevation: 0,
                                  child: Form(
                                    key: value.keyForm,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            RatingBar.builder(
                                              initialRating: value.rating,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding: EdgeInsets.symmetric(horizontal: 4),
                                              itemBuilder: (context, index) {
                                                return value.emoticonForIndex(index);
                                              },
                                              onRatingUpdate: (rating) {
                                                value.setRating(rating);
                                              }
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'Rating: ${value.rating}',
                                              style: Theme.of(context).textTheme.bodyMedium,
                                            ),
                                            SizedBox(height: 20),
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 20),
                                              child: TextFormField(
                                                controller: value.review,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Ulasan tidak boleh kosong";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                maxLength: 255,
                                                decoration: InputDecoration(
                                                  hintText: 'Berikan ulasan Anda...',
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            FilledButton(
                                              onPressed: () {
                                                value.cekRating();
                                              },
                                              child: Text(
                                                'Kirim Penilaian',
                                                style: Theme.of(context).textTheme.bodyMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ])),
          ),
        ));
  }
}
