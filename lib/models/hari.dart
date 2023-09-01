class Hari {
  String? idHari;
  String? hari;

  Hari({
    this.idHari,
    this.hari,
  });

  factory Hari.fromJson(Map<String, dynamic> json) => Hari(
        idHari: json["id_hari"],
        hari: json["hari"],
      );

  Map<String, dynamic> toJson() => {
        "id_hari": idHari,
        "hari": hari,
      };
}
