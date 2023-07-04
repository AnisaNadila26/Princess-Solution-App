import 'package:shared_preferences/shared_preferences.dart';

import 'package:princess_solution/models/data.dart';

class Preference {
  static String noRegistrasi = "no_registrasi";
  static String nama = "nama";
  static String tanggalLahir = "ttl";
  static String email = "email";
  static String telpon = "telpon";
  static String pekerjaan = "pekerjaan";
  static String alamat = "alamat";
  static String jenisKendaraan = "jenis_kendaraan";
  static String kodeKendaraan = "kode_kendaraan";
  static String instruktur = "instruktur";
  static String paket = "paket";
  static String jadwal = "jadwal";
  static String status = "status";
  static String jenisPembayaran = "jenis_pembayaran";
  static String jumlahPembayaran = "jumlah_pembayaran";
  static String sisaPembayaran = "sisa_pembayaran";
  static String kehadiran = "kehadiran";
  static String qr = "qr";
  static String createdAt = "created_at";
  static String updatedAt = "updated_at";

  setUsers(Data users) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(Preference.noRegistrasi, users.noRegistrasi);
    pref.setString(Preference.nama, users.nama);
    pref.setString(Preference.tanggalLahir, users.tanggalLahir);
    pref.setString(Preference.email, users.email);
    pref.setString(Preference.telpon, users.telpon);
    pref.setString(Preference.pekerjaan, users.pekerjaan);
    pref.setString(Preference.alamat, users.alamat);
    pref.setString(Preference.jenisKendaraan, users.jenisKendaraan);
    pref.setString(Preference.kodeKendaraan, users.kodeKendaraan);
    pref.setString(Preference.instruktur, users.instruktur);
    pref.setString(Preference.paket, users.paket);
    pref.setString(Preference.jadwal, users.jadwal);
    pref.setString(Preference.status, users.status);
    pref.setString(Preference.jenisPembayaran, users.jenisPembayaran);
    pref.setString(Preference.jumlahPembayaran, users.jumlahPembayaran);
    pref.setString(Preference.sisaPembayaran, users.sisaPembayaran);
    pref.setString(Preference.kehadiran, users.kehadiran);
    pref.setString(Preference.qr, users.qr);
    pref.setString(Preference.createdAt, users.createdAt);
    pref.setString(Preference.updatedAt, users.updatedAt);
  }

  Future<Data> getUsers() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Data users = Data(
      noRegistrasi: pref.getInt(Preference.noRegistrasi) ?? 0,
      nama: pref.getString(Preference.nama) ?? "",
      tanggalLahir: pref.getString(Preference.tanggalLahir) ?? "",
      email: pref.getString(Preference.email) ?? "",
      telpon: pref.getString(Preference.telpon) ?? "",
      pekerjaan: pref.getString(Preference.pekerjaan) ?? "",
      alamat: pref.getString(Preference.alamat) ?? "",
      jenisKendaraan: pref.getString(Preference.jenisKendaraan) ?? "",
      kodeKendaraan: pref.getString(Preference.kodeKendaraan) ?? "",
      instruktur: pref.getString(Preference.instruktur) ?? "",
      paket: pref.getString(Preference.paket) ?? "",
      jadwal: pref.getString(Preference.jadwal) ?? "",
      status: pref.getString(Preference.status) ?? "",
      jenisPembayaran: pref.getString(Preference.jenisPembayaran) ?? "",
      jumlahPembayaran: pref.getString(Preference.jumlahPembayaran) ?? "",
      sisaPembayaran: pref.getString(Preference.sisaPembayaran) ?? "",
      kehadiran: pref.getString(Preference.kehadiran) ?? "",
      qr: pref.getString(Preference.qr) ?? "",
      createdAt: pref.getString(Preference.createdAt) ?? "",
      updatedAt: pref.getString(Preference.updatedAt) ?? "",
    );

    return users;
  }

  remove() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(Preference.noRegistrasi);
    pref.remove(Preference.nama);
    pref.remove(Preference.tanggalLahir);
    pref.remove(Preference.email);
    pref.remove(Preference.telpon);
    pref.remove(Preference.pekerjaan);
    pref.remove(Preference.alamat);
    pref.remove(Preference.jenisKendaraan);
    pref.remove(Preference.kodeKendaraan);
    pref.remove(Preference.instruktur);
    pref.remove(Preference.paket);
    pref.remove(Preference.jadwal);
    pref.remove(Preference.status);
    pref.remove(Preference.jenisPembayaran);
    pref.remove(Preference.jumlahPembayaran);
    pref.remove(Preference.sisaPembayaran);
    pref.remove(Preference.kehadiran);
    pref.remove(Preference.qr);
    pref.remove(Preference.createdAt);
    pref.remove(Preference.updatedAt);
  }
}
