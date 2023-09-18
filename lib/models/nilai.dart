class Nilai {
  String? idNilai;
  String? noRegistrasi;
  String? idInstruktur;
  String? nilai;
  String? catatan;
  String? idHari;

  Nilai({
    required this.idNilai,
    required this.noRegistrasi,
    required this.idInstruktur,
    required this.nilai,
    required this.catatan,
    required this.idHari,
  });

  factory Nilai.fromJson(Map<String, dynamic> json) {
    return Nilai(
      idNilai: json['id_nilai'],
      noRegistrasi: json['no_registrasi'],
      idInstruktur: json['id_instruktur'],
      nilai: json['nilai'],
      catatan: json['catatan'],
      idHari: json['idHari'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_nilai': idNilai,
      'no_registrasi': noRegistrasi,
      'id_instruktur': idInstruktur,
      'nilai': nilai,
      'catatan': catatan,
      'id_hari': idHari,
    };
  }
}
