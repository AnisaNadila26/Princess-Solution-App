class Instruktur {
  String? idInstruktur;
  String? nama;
  String? email;
  String? tanggalLahir;
  int? usia;
  String? fotoProfil;
  String? jumlahSiswa;
  // List<Data>? siswaListManual;
  // List<Data>? siswaListMatic;
  double? rating;
  String? createdAt;
  String? updatedAt;
  String? role;

  Instruktur({
    this.idInstruktur,
    this.nama,
    this.email,
    this.tanggalLahir,
    this.usia,
    this.fotoProfil,
    this.jumlahSiswa,
    // this.siswaListManual,
    // this.siswaListMatic,
    this.rating,
    this.createdAt,
    this.updatedAt,
    this.role,
  });

  factory Instruktur.fromJson(Map<String, dynamic> json) => Instruktur(
        idInstruktur: json["id_instruktur"],
        nama: json["nama_instruktur"],
        email: json["email_instruktur"],
        tanggalLahir: json["tgl_lahir"],
        usia: json["usia"],
        fotoProfil: json["foto_ins"],
        jumlahSiswa: json["jumlah_siswa"],
        // siswaListManual: json["siswa_list_manual"],
        // siswaListMatic: json["siswa_list_matic"],
        rating: json["rating"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id_instruktur": idInstruktur,
        "nama_instruktur": nama,
        "email_instruktur": email,
        "tgl_lahir": tanggalLahir,
        "usia": usia,
        "foto_ins": fotoProfil,
        "jumlah_siswa": jumlahSiswa,
        // "siswa_list_manual": siswaListManual,
        // "siswa_list_matic": siswaListMatic,
        "rating": rating,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "role": role,
      };
}
