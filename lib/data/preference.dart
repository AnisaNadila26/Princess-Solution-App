import 'package:shared_preferences/shared_preferences.dart';
import 'package:princess_solution/models/user.dart';

class Preference {
  static String id = "id";
  static String nama = "nama";
  static String email = "email";
  static String ttl = "ttl";
  static String telpon = "telpon";
  static String pekerjaan = "pekerjaan";
  static String alamat = "alamat";
  static String fotoProfil = "foto_profil";
  static String jenisKendaraan = "jenis_kendaraan";
  static String kodeKendaraan = "kode_kendaraan";
  static String idInstruktur = "id_instruktur";
  static String namaInstruktur = "nama_instruktur";
  static String kodePaket = "kode_paket";
  static String jadwal = "jadwal";
  static String status = "status";
  static String pembayaran = "pembayaran";
  static String harga = "harga";
  static String sisa = "sisa";
  static String kehadiran = "kehadiran";
  static String rating = "rating";
  static String review = "review";
  static String role = "role";

  setUsers(User users) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // pref.setInt(Preference.id, users.id);
    pref.setString(Preference.id, users.id!);
    pref.setString(Preference.nama, users.nama!);
    pref.setString(Preference.email, users.email!);
    pref.setString(Preference.ttl, users.ttl!);
    pref.setString(Preference.telpon, users.telpon!);
    pref.setString(Preference.pekerjaan, users.pekerjaan!);
    pref.setString(Preference.alamat, users.alamat!);
    pref.setString(Preference.fotoProfil, users.fotoProfil!);
    pref.setString(Preference.jenisKendaraan, users.jenisKendaraan!);
    pref.setString(Preference.kodeKendaraan, users.kodeKendaraan!);
    pref.setString(Preference.idInstruktur, users.idInstruktur!);
    pref.setString(Preference.namaInstruktur, users.namaInstruktur!);
    pref.setString(Preference.kodePaket, users.kodePaket!);
    pref.setString(Preference.jadwal, users.jadwal!);
    pref.setString(Preference.status, users.status!);
    pref.setString(Preference.pembayaran, users.pembayaran!);
    pref.setString(Preference.harga, users.harga!);
    pref.setString(Preference.sisa, users.sisa!);
    pref.setString(Preference.kehadiran, users.kehadiran!);
    pref.setString(Preference.rating, users.rating!);
    pref.setString(Preference.review, users.review!);
    pref.setString(Preference.role, users.role!);
  }

  setEdit(User users) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // pref.setInt(Preference.id, users.id);
    pref.setString(Preference.id, users.id!);
    pref.setString(Preference.nama, users.nama!);
    pref.setString(Preference.email, users.email!);
    // pref.setString(Preference.idAkun, users.idAkun!);
    pref.setString(Preference.ttl, users.ttl!);
    pref.setString(Preference.telpon, users.telpon!);
    pref.setString(Preference.pekerjaan, users.pekerjaan!);
    pref.setString(Preference.alamat, users.alamat!);
    pref.setString(Preference.fotoProfil, users.fotoProfil!);
    pref.setString(Preference.idInstruktur, users.idInstruktur!);
    pref.setString(Preference.jadwal, users.jadwal!);
    pref.setString(Preference.status, users.status!);
    pref.setString(Preference.pembayaran, users.pembayaran!);
    pref.setString(Preference.harga, users.harga!);
    pref.setString(Preference.sisa, users.sisa!);
    pref.setString(Preference.kehadiran, users.kehadiran!);
  }

  setRating(User users) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // pref.setInt(Preference.id, users.id);
    pref.setString(Preference.id, users.id!);
    pref.setString(Preference.idInstruktur, users.idInstruktur!);
    pref.setString(Preference.rating, users.rating!);
    pref.setString(Preference.review, users.review!);
  }

  Future<User> getUsers() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    User users = User(
      // id: pref.getInt(Preference.id) ?? 0,
      id: pref.getString(Preference.id) ?? "zero",
      nama: pref.getString(Preference.nama) ?? "",
      email: pref.getString(Preference.email) ?? "",
      ttl: pref.getString(Preference.ttl) ?? "",
      telpon: pref.getString(Preference.telpon) ?? "",
      pekerjaan: pref.getString(Preference.pekerjaan) ?? "",
      alamat: pref.getString(Preference.alamat) ?? "",
      fotoProfil: pref.getString(Preference.fotoProfil) ?? "",
      jenisKendaraan: pref.getString(Preference.jenisKendaraan) ?? "",
      kodeKendaraan: pref.getString(Preference.kodeKendaraan) ?? "",
      idInstruktur: pref.getString(Preference.idInstruktur) ?? "",
      namaInstruktur: pref.getString(Preference.namaInstruktur) ?? "",
      kodePaket: pref.getString(Preference.kodePaket) ?? "",
      jadwal: pref.getString(Preference.jadwal) ?? "",
      status: pref.getString(Preference.status) ?? "",
      pembayaran: pref.getString(Preference.pembayaran) ?? "",
      harga: pref.getString(Preference.harga) ?? "",
      sisa: pref.getString(Preference.sisa) ?? "",
      kehadiran: pref.getString(Preference.kehadiran) ?? "",
      rating: (pref.getString(Preference.rating) ?? ""),
      review: (pref.getString(Preference.review) ?? ""),
      role: (pref.getString(Preference.role) ?? ""),
    );

    return users;
  }

  remove() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(Preference.id);
    pref.remove(Preference.nama);
    pref.remove(Preference.ttl);
    pref.remove(Preference.email);
    pref.remove(Preference.telpon);
    pref.remove(Preference.pekerjaan);
    pref.remove(Preference.alamat);
    pref.remove(Preference.fotoProfil);
    pref.remove(Preference.jenisKendaraan);
    pref.remove(Preference.kodeKendaraan);
    pref.remove(Preference.idInstruktur);
    pref.remove(Preference.namaInstruktur);
    pref.remove(Preference.kodePaket);
    pref.remove(Preference.jadwal);
    pref.remove(Preference.status);
    pref.remove(Preference.pembayaran);
    pref.remove(Preference.harga);
    pref.remove(Preference.sisa);
    pref.remove(Preference.kehadiran);
    pref.remove(Preference.rating);
    pref.remove(Preference.review);
    pref.remove(Preference.role);
  }

  // removeFotoProfil() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.remove(Preference.fotoProfil);
  // }
}
