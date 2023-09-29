class NilaiAkhir {
  String? idNilaiAkhir;
  String? noRegistrasi;
  String? idInstruktur;
  String? penilaian;
  String? emotional;
  String? kenyamanan;
  String? penguasaan;
  String? createdAt;
  String? updatedAt;

  NilaiAkhir({
    required this.idNilaiAkhir,
    required this.noRegistrasi,
    required this.idInstruktur,
    required this.penilaian,
    required this.emotional,
    required this.kenyamanan,
    required this.penguasaan,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NilaiAkhir.fromJson(Map<String, dynamic> json) {
    return NilaiAkhir(
      idNilaiAkhir: json['id_nilaiAkhir'],
      noRegistrasi: json['no_registrasi'],
      idInstruktur: json['id_instruktur'],
      penilaian: json['penilaian'],
      emotional: json['emotional'],
      kenyamanan: json['kenyamanan'],
      penguasaan: json['penguasaan'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_nilaiAkhir': idNilaiAkhir,
      'no_registrasi': noRegistrasi,
      'id_instruktur': idInstruktur,
      'penilaian': penilaian,
      'emotional': emotional,
      'kenyamanan': kenyamanan,
      'penguasaan': penguasaan,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  void clear() {}
}
