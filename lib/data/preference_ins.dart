import 'package:shared_preferences/shared_preferences.dart';
import 'package:princess_solution/models/instruktur.dart';

class PreferenceInstruktur {
  static String idInstruktur = "id_instruktur";
  static String nama = "nama_instruktur";
  static String email = "email_instruktur";
  static String tanggalLahir = "tgl_lahir";
  static String usia = "usia";
  static String fotoProfil = "foto_ins";
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
    pref.setString(PreferenceInstruktur.tanggalLahir, ins.tanggalLahir!);
    pref.setInt(PreferenceInstruktur.usia, ins.usia!);
    pref.setString(PreferenceInstruktur.fotoProfil, ins.fotoProfil!);
    pref.setString(PreferenceInstruktur.jumlahSiswa, ins.jumlahSiswa!);
    pref.setString(PreferenceInstruktur.rating, ins.rating!);
    pref.setString(PreferenceInstruktur.createdAt, ins.createdAt!);
    pref.setString(PreferenceInstruktur.updatedAt, ins.updatedAt!);
    pref.setString(PreferenceInstruktur.role, ins.role!);
  }

  setEdit(Instruktur ins) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(PreferenceInstruktur.idInstruktur, ins.idInstruktur!);
    pref.setString(PreferenceInstruktur.nama, ins.nama!);
    pref.setString(PreferenceInstruktur.email, ins.email!);
    pref.setString(PreferenceInstruktur.tanggalLahir, ins.tanggalLahir!);
    pref.setInt(PreferenceInstruktur.usia, ins.usia!);
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
      tanggalLahir: pref.getString(PreferenceInstruktur.tanggalLahir) ?? "",
      usia: pref.getInt(PreferenceInstruktur.usia) ?? 0,
      fotoProfil: pref.getString(PreferenceInstruktur.fotoProfil) ?? "",
      jumlahSiswa: pref.getString(PreferenceInstruktur.jumlahSiswa) ?? "",
      rating: pref.getString(PreferenceInstruktur.rating) ?? "",
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
    pref.remove(PreferenceInstruktur.tanggalLahir);
    pref.remove(PreferenceInstruktur.usia);
    pref.remove(PreferenceInstruktur.fotoProfil);
    pref.remove(PreferenceInstruktur.jumlahSiswa);
    pref.remove(PreferenceInstruktur.rating);
    pref.remove(PreferenceInstruktur.createdAt);
    pref.remove(PreferenceInstruktur.updatedAt);
    pref.remove(PreferenceInstruktur.role);
  }
}