class Nilai {
  String? idNilai;
  String? id;
  String? idInstruktur;
  String? nilai;
  String? catatan;
  String? idHari;

  Nilai({
    required this.idNilai,
    required this.id,
    required this.idInstruktur,
    required this.nilai,
    required this.catatan,
    required this.idHari,
  });

  factory Nilai.fromJson(Map<String, dynamic> json) {
    return Nilai(
      idNilai: json['id_nilai'],
      id: json['id'],
      idInstruktur: json['id_instruktur'],
      nilai: json['nilai'],
      catatan: json['catatan'],
      idHari: json['idHari'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_nilai': idNilai,
      'id': id,
      'id_instruktur': idInstruktur,
      'nilai': nilai,
      'catatan': catatan,
      'id_hari': idHari,
    };
  }
}
