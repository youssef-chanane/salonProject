

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:flutter_laravel/services/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class Salon extends ChangeNotifier{
  String _token;
    final storage = new FlutterSecureStorage();
  //store salon 
    void store({Map creds}) async {
    print(creds);

    try{
      _token=Auth.token;
      print(_token);
      Dio.Response response2 = await dio().put('/user/upgradetosalon',
            options: Dio.Options(headers: {'Authorization': 'Bearer $_token'}));
      Dio.Response response = await dio().post('/salon',data: creds,
            options: Dio.Options(headers: {'Authorization': 'Bearer $_token'}));

      // /user/upgradetosalon
    }catch(e){
      print(e.toString());
    }
  }
    //store service 
    void storeService({Map creds}) async {
    print(creds);

    try{
      _token=Auth.token;
      print(_token);
      Dio.Response response = await dio().post('/service',data: creds,
            options: Dio.Options(headers: {'Authorization': 'Bearer $_token'}));

      // /user/upgradetosalon
    }catch(e){
      print(e.toString());
    }
  }

      //store barber 
    void storeBarber({Map creds}) async {
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