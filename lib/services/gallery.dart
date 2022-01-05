// import 'dart:html' as h;
import 'dart:io';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter_laravel/services/dio.dart';
import 'package:dio/adapter.dart';

// import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_laravel/services/auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Gallery extends ChangeNotifier{
  final storage = new FlutterSecureStorage();
  static List<dynamic>  _images;
  static List<dynamic> get images=>_images;

void store(String path) async {
    String _token;

    print(path);
    _token=Auth.token;

    print(_token);
    try{
    var formData = Dio.FormData.fromMap({
        "image":
            await Dio.MultipartFile.fromFile(path) ,
    });

    print(formData);
    Dio.Response response = await dio().post("/image", data: formData,
            options: Dio.Options(
              headers: {
             'Authorization': 'Bearer $_token'
              }
              ));
    }catch(e){
      print(e.toString());
    }
}
void show(int id) async {
  try{

  Dio.Response response = await dio().get('/image/$id');
  // print(response.data);
  _images=response.data;
  print(response.data);
}catch(e){
    print(e);
  }
}
}