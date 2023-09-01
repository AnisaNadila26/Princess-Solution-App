class Data {
  String? noRegistrasi;
  String? nama;
  String? ttl;
  String? telpon;
  String? pekerjaan;
  String? alamat;
  String? fotoProfil;
  String? paket;
  String? jenisKendaraan;
  String? kodeKendaraan;

  Data({
    this.noRegistrasi,
    this.nama,
    this.ttl,
    this.telpon,
    this.pekerjaan,
    this.alamat,
    this.fotoProfil,
    this.paket,
    this.jenisKendaraan,
    this.kodeKendaraan,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        noRegistrasi: json["no_registrasi"],
        nama: json["nama"],
        ttl: json["ttl"],
        telpon: json["telpon"],
        pekerjaan: json["pekerjaan"],
        alamat: json["alamat"],
        fotoProfil: json["foto_profil"],
        paket: json["paket"],
        jenisKendaraan: json["jenis_kendaraan"],
        kodeKendaraan: json["kode_kendaraan"],
      );

  Map<String, dynamic> toJson() => {
        "no_registrasi": noRegistrasi,
        "nama": nama,
        "ttl": ttl,
        "telpon": telpon,
        "pekerjaan": pekerjaan,
        "alamat": alamat,
        "foto_profil": fotoProfil,
        "paket": paket,
        "jenis_kendaraan": jenisKendaraan,
        "kode_kendaraan": kodeKendaraan,
      };
}
