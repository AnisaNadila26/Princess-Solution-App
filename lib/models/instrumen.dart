class Instrumen {
  String? idInstrumen;
  String? instrumenMobil;
  
  Instrumen({
    required this.idInstrumen,
    required this.instrumenMobil,
  });


  factory Instrumen.fromJson(Map<String, dynamic> json) {
    return Instrumen(
      idInstrumen: json['id_instrumen'],
      instrumenMobil: json['instrumen_mobil'],
    );
  }
  
   Map<String, dynamic> toJson() {
    return {
      'id_instrumen': idInstrumen,
      'instrumen_mobil': instrumenMobil,
    };
  }
}