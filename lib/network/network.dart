const url = 'http://localhost/skripsi/public/api';
const url_imagesProfilSiswa = 'http://localhost/skripsi/public/assets/profilSiswa';
const url_imagesProfilInstruktur = 'http://localhost/skripsi/public/assets/profilInstruktur';
const url_imagesBerita = 'http://localhost/skripsi/public/assets/pengumuman';
var numPhone = '6281279572555';
// var whatsapp = 'whatsapp://send?phone=$numPhone&text=hello';
var whatsapp = 'https://wa.me/$numPhone';

class NetworkURL {
  static String login() {
    return '$url/login';
  }

  // static String getUserInfo(String noRegistrasi) {
  //   return '$url/user-info/$noRegistrasi';
  // }

  static String getListSiswa() {
    return '$url/listsiswa';
  }

  static String getHari() {
    return '$url/hari';
  }

  static String getInstrumen() {
    return '$url/instrumenMobil';
  }

  static String saveNilaiInstrumen() {
    return '$url/kirimInstrumen';
  }

  static String getNilaiInstrumen() {
    return '$url/getNilaiInstrumen';
  }

  static String getMateri() {
    return '$url/materi';
  }

  static String getNilai() {
    return '$url/getNilai';
  }
  
  static String saveNilai() {
    return '$url/nilai';
  }

  static String getNilaiAkhir() {
    return '$url/getNilaiAkhir';
  }

  static String saveNilaiAkhir() {
    return '$url/nilaiAkhir';
  }

  static String getProfilSiswa(String fotoProfil) {
    return '$url_imagesProfilSiswa/$fotoProfil';
  }

  static String getProfilInstruktur(String fotoProfil) {
    return '$url_imagesProfilInstruktur/$fotoProfil';
  }

  static String getBerita() {
    return '$url/berita';
  }

  static String gambarBerita(String image) {
    return '$url_imagesBerita/$image';
  }

  static String sendWA() {
    return '$whatsapp';
  }

  static String ubahProfilSiswa() {
    return '$url/ubahProfilSiswa';
  }

  static String ubahProfilInstruktur() {
    return '$url/ubahProfilIns';
  }

  static String rating() {
    return '$url/rating';
  }

   static String getRating() {
    return '$url/getRating';
  }
}
