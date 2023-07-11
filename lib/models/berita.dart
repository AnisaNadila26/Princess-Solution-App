import 'package:json_annotation/json_annotation.dart';

part 'berita.g.dart';

@JsonSerializable()
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

  factory Berita.fromJson(Map<String, dynamic> json) => _$BeritaFromJson(json);
  Map<String, dynamic> toJson() => _$BeritaToJson(this);
}
