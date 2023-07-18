const url = 'http://localhost/kp/public/api';
const url_imagesProfil = 'http://localhost/kp/public/assets/images/profil';
const url_imagesBerita = 'http://localhost/kp/public/assets/images/berita';
var numPhone = '6281279572555';
// var whatsapp = 'whatsapp://send?phone=$numPhone&text=hello';
var whatsapp = 'https://wa.me/$numPhone';

class NetworkURL {
  static String login() {
    return '$url/login';
  }

  static String getProfil(String fotoProfil) {
    return '$url_imagesProfil/$fotoProfil';
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
}
