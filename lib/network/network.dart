const url = 'http://localhost/kp/public/api';
const url_imagesProfil = 'http://localhost/kp/public/assets/images/profil';
const url_imagesBerita = 'http://localhost/kp/public/assets/images/berita';

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
}
