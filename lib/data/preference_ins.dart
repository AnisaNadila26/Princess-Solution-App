import 'package:shared_preferences/shared_preferences.dart';
import 'package:princess_solution/models/instruktur.dart';

class PreferenceInstruktur {
  static String idInstruktur = "id_instruktur";
  static String nama = "nama";
  static String email = "email";
  static String telpon = "telpon";
  static String usia = "usia";
  static String fotoProfil = "foto_profil";
  static String jumlahSiswa = "jumlah_siswa";
  static String rating = "rating";
  static String createdAt = "created_at";
  static String updatedAt = "updated_at";
  static String role = "role";


  setInstruktur(Instruktur ins) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(PreferenceInstruktur.idInstruktur, ins.idInstruktur!);
    pref.setString(PreferenceInstruktur.nama, ins.nama!);
    pref.setString(PreferenceInstruktur.email, ins.email!);
    pref.setString(PreferenceInstruktur.telpon, ins.telpon!);
    pref.setString(PreferenceInstruktur.usia, ins.usia!);
    pref.setString(PreferenceInstruktur.fotoProfil, ins.fotoProfil!);
    pref.setInt(PreferenceInstruktur.jumlahSiswa, ins.jumlahSiswa!);
    pref.setDouble(PreferenceInstruktur.rating, ins.rating!);
    pref.setString(PreferenceInstruktur.createdAt, ins.createdAt!);
    pref.setString(PreferenceInstruktur.updatedAt, ins.updatedAt!);
    pref.setString(PreferenceInstruktur.role, ins.role!);
  }

  setEdit(Instruktur ins) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(PreferenceInstruktur.idInstruktur, ins.idInstruktur!);
    pref.setString(PreferenceInstruktur.nama, ins.nama!);
    pref.setString(PreferenceInstruktur.email, ins.email!);
    pref.setString(PreferenceInstruktur.telpon, ins.telpon!);
    pref.setString(PreferenceInstruktur.usia, ins.usia!);
    pref.setString(PreferenceInstruktur.fotoProfil, ins.fotoProfil!);
    pref.setString(PreferenceInstruktur.createdAt, ins.createdAt!);
    pref.setString(PreferenceInstruktur.updatedAt, ins.updatedAt!);
  }

  // setRating(Data users) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   // pref.setInt(Preference.noRegistrasi, users.noRegistrasi);
  //   pref.setString(Preference.noRegistrasi, users.noRegistrasi!);
  //   pref.setString(Preference.idInstruktur, users.idInstruktur!);
  //   pref.setString(Preference.rating, users.rating!);
  //   pref.setString(Preference.review, users.review!);
  // }

  Future<Instruktur> getInstruktur() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Instruktur ins = Instruktur(
      // noRegistrasi: pref.getInt(Preference.noRegistrasi) ?? 0,
      idInstruktur: pref.getString(PreferenceInstruktur.idInstruktur) ?? "zero",
      nama: pref.getString(PreferenceInstruktur.nama) ?? "",
      email: pref.getString(PreferenceInstruktur.email) ?? "",
      telpon: pref.getString(PreferenceInstruktur.telpon) ?? "",
      usia: pref.getString(PreferenceInstruktur.usia) ?? "",
      fotoProfil: pref.getString(PreferenceInstruktur.fotoProfil) ?? "",
      jumlahSiswa: pref.getInt(PreferenceInstruktur.jumlahSiswa) ?? 0,
      rating: pref.getDouble(PreferenceInstruktur.rating) ?? 0,
      createdAt: pref.getString(PreferenceInstruktur.createdAt) ?? "",
      updatedAt: pref.getString(PreferenceInstruktur.updatedAt) ?? "",
      role: pref.getString(PreferenceInstruktur.role) ?? "",
    );

    return ins;
  }

  Future<Instruktur> getInsNilai() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Instruktur ins = Instruktur(
      nama: pref.getString(PreferenceInstruktur.nama) ?? "",
    );

    return ins;
  }

  // setNilai(Nilai nilai) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   // pref.setInt(Preference.noRegistrasi, users.noRegistrasi);
  //   pref.setString(PreferenceInstruktur.noRegistrasi, nilai.noRegistrasi!);
  //   pref.setString(PreferenceInstruktur.idInstruktur, nilai.idInstruktur!);
  //   pref.setString(PreferenceInstruktur.nilai, nilai.nilai!);
  // }

  remove() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(PreferenceInstruktur.idInstruktur);
    pref.remove(PreferenceInstruktur.nama);
    pref.remove(PreferenceInstruktur.email);
    pref.remove(PreferenceInstruktur.telpon);
    pref.remove(PreferenceInstruktur.usia);
    pref.remove(PreferenceInstruktur.fotoProfil);
    pref.remove(PreferenceInstruktur.jumlahSiswa);
    pref.remove(PreferenceInstruktur.rating);
    pref.remove(PreferenceInstruktur.createdAt);
    pref.remove(PreferenceInstruktur.updatedAt);
    pref.remove(PreferenceInstruktur.role);
  }
}
