import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter_laravel/services/dio.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:flutter_laravel/services/salon.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Barber extends ChangeNotifier{
  String _token;
  List<dynamic> _barbers;
  List<dynamic> get barbers=>_barbers;

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
    void show(int id) async {
      // print(id);
      Dio.Response response = await dio().get('/barber/$id');
      _barbers=response.data;
      print(response.data);
    }
    void destroy(int id) async {
    Dio.Response response =await dio().delete('/barber/$id');
    print(_barbers);
  }
}