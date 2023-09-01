class User {
  String? noRegistrasi;
  String? nama;
  String? ttl;
  String? email;
  String? telpon;
  String? pekerjaan;
  String? alamat;
  String? fotoProfil;
  String? jenisKendaraan;
  String? kodeKendaraan;
  String? idInstruktur;
  String? namaInstruktur;
  String? paket;
  String? jadwal;
  String? status;
  String? jenisPembayaran;
  String? jumlahPembayaran;
  String? sisaPembayaran;
  String? kehadiran;
  String? qr;
  String? createdAt;
  String? updatedAt;
  String? rating;
  String? review;
  String? role;

  User({
    this.noRegistrasi,
    this.nama,
    this.ttl,
    this.email,
    this.telpon,
    this.pekerjaan,
    this.alamat,
    this.fotoProfil,
    this.jenisKendaraan,
    this.kodeKendaraan,
    this.idInstruktur,
    this.namaInstruktur,
    this.paket,
    this.jadwal,
    this.status,
    this.jenisPembayaran,
    this.jumlahPembayaran,
    this.sisaPembayaran,
    this.kehadiran,
    this.qr,
    this.createdAt,
    this.updatedAt,
    this.rating,
    this.review,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        noRegistrasi: json["no_registrasi"],
        nama: json["nama"],
        ttl: json["ttl"],
        email: json["email"],
        telpon: json["telpon"],
        pekerjaan: json["pekerjaan"],
        alamat: json["alamat"],
        fotoProfil: json["foto_profil"],
        jenisKendaraan: json["jenis_kendaraan"],
        kodeKendaraan: json["kode_kendaraan"],
        idInstruktur: json["id_instruktur"],
        namaInstruktur: json["nama_instruktur"],
        paket: json["paket"],
        jadwal: json["jadwal"],
        status: json["status"],
        jenisPembayaran: json["jenis_pembayaran"],
        jumlahPembayaran: json["jumlah_pembayaran"],
        sisaPembayaran: json["sisa_pembayaran"],
        kehadiran: json["kehadiran"],
        qr: json["qr"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        rating: json["rating"],
        review: json["review"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "no_registrasi": noRegistrasi,
        "nama": nama,
        "ttl": ttl,
        "email": email,
        "telpon": telpon,
        "pekerjaan": pekerjaan,
        "alamat": alamat,
        "foto_profil": fotoProfil,
        "jenis_kendaraan": jenisKendaraan,
        "kode_kendaraan": kodeKendaraan,
        "id_instruktur": idInstruktur,
        "nama_instruktur": namaInstruktur,
        "paket": paket,
        "jadwal": jadwal,
        "status": status,
        "jenis_pembayaran": jenisPembayaran,
        "jumlah_pembayaran": jumlahPembayaran,
        "sisa_pembayaran": sisaPembayaran,
        "kehadiran": kehadiran,
        "qr": qr,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "rating": rating,
        "review": review,
        "role": role,
      };
}
