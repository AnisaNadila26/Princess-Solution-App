// import 'package:json_annotation/json_annotation.dart';

// part 'data.g.dart';

// @JsonSerializable()
// class Data {
//   Data ({
//     required this.noRegistrasi,
//     required this.nama,
//     required this.tanggalLahir,
//     required this.email,
//     required this.telpon,
//     required this.pekerjaan,
//     required this.alamat,
//     required this.fotoProfil,
//     required this.jenisKendaraan,
//     required this.kodeKendaraan,
//     required this.instruktur,
//     required this.paket,
//     required this.jadwal,
//     required this.status,
//     required this.jenisPembayaran,
//     required this.jumlahPembayaran,
//     required this.sisaPembayaran,
//     required this.kehadiran,
//     required this.qr,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   @JsonKey(name: 'no_registrasi')
//   String noRegistrasi;
//   String nama;
//   @JsonKey(name: 'ttl')
//   String tanggalLahir;
//   String email;
//   String telpon;
//   String pekerjaan;
//   String alamat;
//   @JsonKey(name: 'foto_profil')
//   String fotoProfil;
//   @JsonKey(name: 'jenis_kendaraan')
//   String jenisKendaraan;
//   @JsonKey(name: 'kode_kendaraan')
//   String kodeKendaraan;
//   String instruktur;
//   String paket;
//   String jadwal;
//   String status;
//   @JsonKey(name: 'jenis_pembayaran')
//   String jenisPembayaran;
//   @JsonKey(name: 'jumlah_pembayaran')
//   String jumlahPembayaran;
//   @JsonKey(name: 'sisa_pembayaran')
//   String sisaPembayaran;
//   String kehadiran;
//   String qr;
//   @JsonKey(name: 'created_at')
//   String createdAt;
//   @JsonKey(name: 'updated_at')
//   String updatedAt;

//   factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
//   Map<String, dynamic> toJson() => _$DataToJson(this);
// }

import 'package:princess_solution/models/instruktur.dart';

class Data {
  Data({
    required this.noRegistrasi,
    required this.nama,
    required this.tanggalLahir,
    required this.email,
    required this.telpon,
    required this.pekerjaan,
    required this.alamat,
    required this.fotoProfil,
    required this.jenisKendaraan,
    required this.kodeKendaraan,
    required this.instruktur,
    required this.paket,
    required this.jadwal,
    required this.status,
    required this.jenisPembayaran,
    required this.jumlahPembayaran,
    required this.sisaPembayaran,
    required this.kehadiran,
    required this.qr,
    required this.createdAt,
    required this.updatedAt,
  });

  String noRegistrasi;
  String nama;
  String tanggalLahir;
  String email;
  String telpon;
  String pekerjaan;
  String alamat;
  String fotoProfil;
  String jenisKendaraan;
  String kodeKendaraan;
  Instruktur instruktur;
  String paket;
  String jadwal;
  String status;
  String jenisPembayaran;
  String jumlahPembayaran;
  String sisaPembayaran;
  String kehadiran;
  String qr;
  String createdAt;
  String updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      noRegistrasi: json['no_registrasi'],
      nama: json['nama'],
      tanggalLahir: json['ttl'],
      email: json['email'],
      telpon: json['telpon'],
      pekerjaan: json['pekerjaan'],
      alamat: json['alamat'],
      fotoProfil: json['foto_profil'],
      jenisKendaraan: json['jenis_kendaraan'],
      kodeKendaraan: json['kode_kendaraan'],
      instruktur: json['instruktur'],
      paket: json['paket'],
      jadwal: json['jadwal'],
      status: json['status'],
      jenisPembayaran: json['jenis_pembayaran'],
      jumlahPembayaran: json['jumlah_pembayaran'],
      sisaPembayaran: json['sisa_pembayaran'],
      kehadiran: json['kehadiran'],
      qr: json['qr'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'no_registrasi': noRegistrasi,
      'nama': nama,
      'ttl': tanggalLahir,
      'email': email,
      'telpon': telpon,
      'pekerjaan': pekerjaan,
      'alamat': alamat,
      'foto_profil': fotoProfil,
      'jenis_kendaraan': jenisKendaraan,
      'kode_kendaraan': kodeKendaraan,
      'instruktur': instruktur,
      'paket': paket,
      'jadwal': jadwal,
      'status': status,
      'jenis_pembayaran': jenisPembayaran,
      'jumlah_pembayaran': jumlahPembayaran,
      'sisa_pembayaran': sisaPembayaran,
      'kehadiran': kehadiran,
      'qr': qr,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
