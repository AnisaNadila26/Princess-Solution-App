import 'package:flutter/material.dart';
import 'package:princess_solution/repository/rating_repository.dart';
import 'package:princess_solution/rating/rating_page.dart';
import 'package:princess_solution/data/preference.dart';
import 'package:princess_solution/models/user.dart';
import 'package:princess_solution/network/network.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RatingNotifier extends ChangeNotifier {
  final BuildContext context;

  RatingNotifier(this.context) {
    getProfile();
    notifyListeners();
  }

  User? users;
  int noRegistrasi = 0;
  int idInstruktur = 0;
  double rating = 0;
  TextEditingController review = TextEditingController();
  var isLoading = true;
  bool isRatingEditable = false;

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  void setRating(double newRating) {
    rating = newRating;
    notifyListeners();
  }

  emoticonForIndex(int index) {
    switch (index) {
      case 0:
        return Icon(
          MdiIcons.emoticonDeadOutline,
          color: Colors.red,
        );
      case 1:
        return Icon(
          MdiIcons.emoticonSadOutline,
          color: Colors.redAccent,
        );
      case 2:
        return Icon(
          MdiIcons.emoticonNeutralOutline,
          color: Colors.amber,
        );
      case 3:
        return Icon(
          MdiIcons.emoticonHappyOutline,
          color: Colors.lightGreen,
        );
      case 4:
        return Icon(
          MdiIcons.emoticonExcitedOutline,
          color: Colors.green,
        );
    }
  }

  cekRating() {
    if (keyForm.currentState!.validate()) {
      saveRating();
    }
  }

  Future saveRating() async {
    try {
      var response = await RatingRepository.rating(
        NetworkURL.rating(),
        noRegistrasi,
        idInstruktur,
        rating,
        review.text.trim(),
      );

      if (response['code'] == 200) {
        User users = User.fromJson(response['data']);
        Preference().setRating(users);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => RatingPage()),
        );
        final snackBar = SnackBar(
          content: Text(
            'Penilaian berhasil dikirim',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          backgroundColor: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(50),
          elevation: 30,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        final snackBar = SnackBar(
          content: Text(
            'Penilaian gagal dikirim',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          backgroundColor: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(50),
          elevation: 30,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  getProfile() async {
    isLoading = true;
    Preference().getUsers().then((value) {
      users = value;
      noRegistrasi = int.parse(users!.noRegistrasi!);
      idInstruktur = int.parse(users!.idInstruktur!);
      notifyListeners();
      isLoading = false;
      notifyListeners();
    });
  }
}
