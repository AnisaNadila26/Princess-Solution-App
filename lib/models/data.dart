class Data {
  String? id;
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
    this.id,
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
        id: json["id"],
        nama: json["nama"],
        ttl: json["ttl"],
        telpon: json["telpon"],
        pekerjaan: json["pekerjaan"],
        alamat: json["alamat"],
        fotoProfil: json["foto_profil"],
        paket: json["kode_paket"],
        jenisKendaraan: json["jenis_kendaraan"],
        kodeKendaraan: json["kode_kendaraan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "ttl": ttl,
        "telpon": telpon,
        "pekerjaan": pekerjaan,
        "alamat": alamat,
        "foto_profil": fotoProfil,
        "kode_paket": paket,
        "jenis_kendaraan": jenisKendaraan,
        "kode_kendaraan": kodeKendaraan,
      };
}
