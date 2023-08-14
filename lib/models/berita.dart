class Berita {
  Berita({
    required this.id,
    required this.judul,
    required this.image,
    required this.tanggal,
    required this.isi,
  });

  String id;
  String judul;
  String image;
  String tanggal;
  String isi;

  factory Berita.fromJson(Map<String, dynamic> json) {
    return Berita(
      id: json['id'],
      judul: json['judul'],
      image: json['image'],
      tanggal: json['tanggal'],
      isi: json['isi'],
    );
  }
  
   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'judul': judul,
      'image': image,
      'tanggal': tanggal,
      'isi': isi,
    };
  }
}