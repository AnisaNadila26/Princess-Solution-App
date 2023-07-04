import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  Data ({
    required this.noRegistrasi,
    required this.nama,
    required this.tanggalLahir,
    required this.email,
    required this.telpon,
    required this.pekerjaan,
    required this.alamat,
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

  @JsonKey(name: 'no_registrasi')
  int noRegistrasi;
  String nama;
  @JsonKey(name: 'ttl')
  String tanggalLahir;
  String email;
  String telpon;
  String pekerjaan;
  String alamat;
  @JsonKey(name: 'jenis_kendaraan')
  String jenisKendaraan;
  @JsonKey(name: 'kode_kendaraan')
  String kodeKendaraan;
  String instruktur;
  String paket;
  String jadwal;
  String status;
  @JsonKey(name: 'jenis_pembayaran')
  String jenisPembayaran;
  @JsonKey(name: 'jumlah_pembayaran')
  String jumlahPembayaran;
  @JsonKey(name: 'sisa_pembayaran')
  String sisaPembayaran;
  String kehadiran;
  String qr;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'updated_at')
  String updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
