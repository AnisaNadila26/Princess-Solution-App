class Materi {
  String? idMateri;
  String? namaMateri;
  String? idKategori;
  String? namaKategori;
  String? hari;
  
  Materi({
    required this.idMateri,
    required this.namaMateri,
    required this.idKategori,
    required this.namaKategori,
    required this.hari,
  });


  factory Materi.fromJson(Map<String, dynamic> json) {
    return Materi(
      idMateri: json['id_materi'],
      namaMateri: json['nama_materi'],
      idKategori: json['id_kategori'],
      namaKategori: json['nama_kategori'],
      hari: json['hari'],
    );
  }
  
   Map<String, dynamic> toJson() {
    return {
      'id_materi': idMateri,
      'nama_materi': namaMateri,
      'id_kategori': idKategori,
      'nama_kategori': namaKategori,
      'hari': hari,
    };
  }
}