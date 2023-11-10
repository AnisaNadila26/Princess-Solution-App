class User {
  String? id;
  String? nama;
  String? email;
  String? ttl;
  String? telpon;
  String? pekerjaan;
  String? alamat;
  String? fotoProfil;
  String? jenisKendaraan;
  String? kodeKendaraan;
  String? idInstruktur;
  String? namaInstruktur;
  String? kodePaket;
  String? jadwal;
  String? status;
  String? pembayaran;
  String? harga;
  String? sisa;
  String? kehadiran;
  double? rating;
  String? review;
  String? role;

  User({
    this.id,
    this.nama,
    this.email,
    this.ttl,
    this.telpon,
    this.pekerjaan,
    this.alamat,
    this.fotoProfil,
    this.jenisKendaraan,
    this.kodeKendaraan,
    this.idInstruktur,
    this.namaInstruktur,
    this.kodePaket,
    this.jadwal,
    this.status,
    this.pembayaran,
    this.harga,
    this.sisa,
    this.kehadiran,
    this.rating,
    this.review,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        nama: json["nama"],
        ttl: json["ttl"],
        telpon: json["telpon"],
        pekerjaan: json["pekerjaan"],
        alamat: json["alamat"],
        fotoProfil: json["foto_profil"],
        jenisKendaraan: json["jenis_kendaraan"],
        kodeKendaraan: json["kode_kendaraan"],
        idInstruktur: json["id_instruktur"],
        namaInstruktur: json["nama_instruktur"],
        kodePaket: json["kode_paket"],
        jadwal: json["jadwal"],
        status: json["status"],
        pembayaran: json["pembayaran"],
        harga: json["harga"],
        sisa: json["sisa"],
        kehadiran: json["kehadiran"],
        rating: json["rating"],
        review: json["review"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "email": email,
        "ttl": ttl,
        "telpon": telpon,
        "pekerjaan": pekerjaan,
        "alamat": alamat,
        "foto_profil": fotoProfil,
        "jenis_kendaraan": jenisKendaraan,
        "kode_kendaraan": kodeKendaraan,
        "id_instruktur": idInstruktur,
        "nama_instruktur": namaInstruktur,
        "kode_paket": kodePaket,
        "jadwal": jadwal,
        "status": status,
        "pembayaran": pembayaran,
        "harga": harga,
        "sisa": sisa,
        "kehadiran": kehadiran,
        "rating": rating,
        "review": review,
        "role": role,
      };
}
