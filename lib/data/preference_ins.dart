import 'package:princess_solution/models/nilai.dart';
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
  static String noRegistrasi = "no_registrasi";
  static String nilai = "nilai";
  static String idMateri = "id_materi";


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
  }

  // setEdit(Instruktur ins) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.setString(Preference.noRegistrasi, users.noRegistrasi!);
  //   pref.setString(Preference.nama, users.nama!);
  //   pref.setString(Preference.tanggalLahir, users.ttl!);
  //   pref.setString(Preference.email, users.email!);
  //   pref.setString(Preference.telpon, users.telpon!);
  //   pref.setString(Preference.pekerjaan, users.pekerjaan!);
  //   pref.setString(Preference.alamat, users.alamat!);
  //   pref.setString(Preference.fotoProfil, users.fotoProfil!);
  //   pref.setString(Preference.jenisKendaraan, users.jenisKendaraan!);
  //   pref.setString(Preference.kodeKendaraan, users.kodeKendaraan!);
  //   pref.setString(Preference.idInstruktur, users.idInstruktur!);
  //   pref.setString(Preference.paket, users.paket!);
  //   pref.setString(Preference.jadwal, users.jadwal!);
  //   pref.setString(Preference.status, users.status!);
  //   pref.setString(Preference.jenisPembayaran, users.jenisPembayaran!);
  //   pref.setString(Preference.jumlahPembayaran, users.jumlahPembayaran!);
  //   pref.setString(Preference.sisaPembayaran, users.sisaPembayaran!);
  //   pref.setString(Preference.kehadiran, users.kehadiran!);
  //   pref.setString(Preference.qr, users.qr!);
  //   pref.setString(Preference.createdAt, users.createdAt!);
  //   pref.setString(Preference.updatedAt, users.updatedAt!);
  // }

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
      idInstruktur: pref.getString(PreferenceInstruktur.idInstruktur) ?? "",
      nama: pref.getString(PreferenceInstruktur.nama) ?? "",
      email: pref.getString(PreferenceInstruktur.email) ?? "",
      telpon: pref.getString(PreferenceInstruktur.telpon) ?? "",
      usia: pref.getString(PreferenceInstruktur.usia) ?? "",
      fotoProfil: pref.getString(PreferenceInstruktur.fotoProfil) ?? "",
      jumlahSiswa: pref.getInt(PreferenceInstruktur.jumlahSiswa) ?? 0,
      rating: pref.getDouble(PreferenceInstruktur.rating) ?? 0,
      createdAt: pref.getString(PreferenceInstruktur.createdAt) ?? "",
      updatedAt: pref.getString(PreferenceInstruktur.updatedAt) ?? "",
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

  setNilai(Nilai nilai) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // pref.setInt(Preference.noRegistrasi, users.noRegistrasi);
    pref.setString(PreferenceInstruktur.noRegistrasi, nilai.noRegistrasi!);
    pref.setString(PreferenceInstruktur.idInstruktur, nilai.idInstruktur!);
    pref.setString(PreferenceInstruktur.nilai, nilai.nilai!);
    pref.setString(PreferenceInstruktur.idMateri, nilai.idMateri!);
  }

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
  }
}
