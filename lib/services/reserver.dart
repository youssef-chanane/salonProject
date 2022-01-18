import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter_laravel/services/dio.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Reserver extends ChangeNotifier{
  // String _token;
  final storage = new FlutterSecureStorage();
    List<dynamic> _reservations;
   List<dynamic> get reservations =>_reservations;

    //store service 
  void store({Map creds}) async {
    print(creds);
    try{
      Dio.Response response = await dio().post('/reserve',data: creds);
      // _reservations.add(response);
      // show(response.data["user_id"]);
      _reservations.add(response.data);
      print(_reservations);
    }catch(e){
      print(e.toString());
    }
  }
  void show(int id) async {
      // print(id);
    Dio.Response response = await dio().get('/reserve/$id');
    _reservations=response.data;
      // print(response.data);
  }
  void destroy(int id) async {
    Dio.Response response =await dio().delete('/reserve/$id');
    print(_reservations);
  }
}
