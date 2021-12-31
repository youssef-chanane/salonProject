// import 'dart:html';

// import 'package:dio/dio.dart' as Dio;
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_laravel/services/dio.dart';

// // import 'package:http/http.dart' as http;
// import 'dart:convert';
// class Image extends ChangeNotifier{

// void uploadImage(File file) async {
//     String fileName = file.path.split('/').last;
//     FormData formData = FormData.fromMap({
//         "file":
//             await Dio.MultipartFile.fromFile(file.path, filename:fileName),
//     });
//     Dio.Response response = await dio().post("/info", data: formData);
//     // return response.data['id'];
// }
// }