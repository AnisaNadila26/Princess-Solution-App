const url = 'http://localhost/kp/public/api';
const url_imagesProfilSiswa = 'http://localhost/kp/public/assets/images/profil';
const url_imagesProfilInstruktur = 'http://localhost/kp/public/assets/images/instruktur';
const url_imagesBerita = 'http://localhost/kp/public/assets/images/berita';
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

  static String getMateri() {
    return '$url/materi';
  }

  static String getNilai() {
    return '$url/getNilai';
  }
  
  static String saveNilai() {
    return '$url/nilai';
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
    return '$url/ubahprofilsiswa';
  }

  static String ubahProfilInstruktur() {
    return '$url/ubahprofilins';
  }

  static String rating() {
    return '$url/rating';
  }

   static String getRating() {
    return '$url/getRating';
  }
}
