import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter_laravel/services/dio.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Barber extends ChangeNotifier{
  String _token;
  final storage = new FlutterSecureStorage();

      //store barber 
    void store({Map creds}) async {
      print(creds);

      try{
        _token=Auth.token;
        print(_token);
        Dio.Response response = await dio().post('/barber',data: creds,
              options: Dio.Options(headers: {'Authorization': 'Bearer $_token'}));

      }catch(e){
        print(e.toString());
      }
    }
}