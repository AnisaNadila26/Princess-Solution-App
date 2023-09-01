class Nilai {
  String? idNilai;
  String? noRegistrasi;
  String? idInstruktur;
  String? nilai;
  String? idMateri;

  Nilai({
    required this.idNilai,
    required this.noRegistrasi,
    required this.idInstruktur,
    required this.nilai,
    required this.idMateri,
  });

  factory Nilai.fromJson(Map<String, dynamic> json) {
    return Nilai(
      idNilai: json['id_nilai'],
      noRegistrasi: json['no_registrasi'],
      idInstruktur: json['id_instruktur'],
      nilai: json['nilai'],
      idMateri: json['id_materi'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_nilai': idNilai,
      'no_registrasi': noRegistrasi,
      'id_instruktur': idInstruktur,
      'nilai': nilai,
      'id_materi': idMateri,
    };
  }
}
