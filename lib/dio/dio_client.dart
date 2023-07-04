// import 'package:dio/dio.dart';
// import 'package:princess_solution/dio/dio_exception.dart';
// import 'package:princess_solution/dio/logging.dart';
// import 'package:princess_solution/models/user.dart';

// class DioClient {
//   final Dio _dio = Dio(
//       // BaseOptions(
//       //   baseUrl: 'http://localhost/kp/public/',
//       //   connectTimeout: Duration(seconds: 5000),
//       //   receiveTimeout: Duration(seconds: 3000),
//       //   responseType: ResponseType.json,
//       // ),
//       );
//   final baseUrl = 'http://localhost/kp/public/api';
//   // ..interceptors.add(Logging());

//   // final Dio _dio;

//   Future<User?> getUser({required String nomorRegistrasi}) async {
//     User? user;
//     try {
//       Response userData =
//           await _dio.get(baseUrl + '/APISiswaController/$nomorRegistrasi');
//       return User.fromJson(userData.data);
//     } on DioError catch (err) {
//       final errorMessage = DioException.fromDioError(err).toString();
//       throw errorMessage;
//       // if (e.response != null) {
//       //   print('Dio error!');
//       //   print('STATUS: ${e.response?.statusCode}');
//       //   print('DATA: ${e.response?.data}');
//       //   print('HEADER: ${e.response?.headers}');
//       // } else {
//       //   print('Error sending request!');
//       //   print(e.message);
//       // } 
//       // rethrow;
//       // return user;
//     } catch (e) {
//       print(e);
//       throw e.toString();
//     }
//   }
// }
