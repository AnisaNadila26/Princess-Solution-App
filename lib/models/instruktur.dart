class Instruktur {
  String? idInstruktur;
  String? nama;
  String? email;
  String? telpon;
  String? usia;
  String? fotoProfil;
  int? jumlahSiswa;
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
    this.telpon,
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
        nama: json["nama"],
        email: json["email"],
        telpon: json["telpon"],
        usia: json["usia"],
        fotoProfil: json["foto_profil"],
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
        "nama": nama,
        "email": email,
        "telpon": telpon,
        "usia": usia,
        "foto_profil": fotoProfil,
        "jumlah_siswa": jumlahSiswa,
        // "siswa_list_manual": siswaListManual,
        // "siswa_list_matic": siswaListMatic,
        "rating": rating,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "role": role,
      };
}
