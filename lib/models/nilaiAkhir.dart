class NilaiAkhir {
  String? idNilaiAkhir;
  String? id;
  // String? idInstruktur;
  String? penilaian;
  String? emotional;
  String? kenyamanan;
  String? penguasaan;

  NilaiAkhir({
    required this.idNilaiAkhir,
    required this.id,
    // required this.idInstruktur,
    required this.penilaian,
    required this.emotional,
    required this.kenyamanan,
    required this.penguasaan,
  });

  factory NilaiAkhir.fromJson(Map<String, dynamic> json) {
    return NilaiAkhir(
      idNilaiAkhir: json['id_nilai_akhir'],
      id: json['id'],
      // idInstruktur: json['id_instruktur'],
      penilaian: json['penilaian'],
      emotional: json['emotional'],
      kenyamanan: json['kenyamanan'],
      penguasaan: json['penguasaan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_nilai_akhir': idNilaiAkhir,
      'id': id,
      // 'id_instruktur': idInstruktur,
      'penilaian': penilaian,
      'emotional': emotional,
      'kenyamanan': kenyamanan,
      'penguasaan': penguasaan,
    };
  }
}
