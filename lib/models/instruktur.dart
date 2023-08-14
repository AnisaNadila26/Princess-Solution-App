class Instruktur {
  Instruktur({
    required this.idInstruktur,
    required this.nama,
    required this.usia,
  });

  String idInstruktur;
  String nama;
  String usia;
  
  factory Instruktur.fromJson(Map<String, dynamic> json) {
    return Instruktur(
      idInstruktur: json['id_instruktur'],
      nama: json['nama'],
      usia: json['usia'],
     
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_instruktur': idInstruktur,
      'nama': nama,
      'usia': usia,
    };
  }
}
