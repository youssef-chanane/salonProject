

import 'package:dio/dio.dart' as Dio;
import 'package:flutter_laravel/services/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_laravel/screens/display/salons_screen.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class Salon extends ChangeNotifier{
    String _token;
    static Map<int, bool> _like={0:false};
    static Map<int, bool> get like=>_like;
    static int _likes;
    static int get likes=>_likes;
    static  List<dynamic> _salons;
    static List<dynamic> get salons =>_salons;
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
  void index() async{
    Dio.Response response = await dio().get('/salon');
    _salons=response.data;
    // _like[1]=true;
    for( dynamic _salon in _salons){
      int id=_salon["id"];
      print(id);
      if(_like[id]==null){
       _like[id]=false;
      }
    }
       print(_like);
  }
  void addLike(int id) async{
    
    Dio.Response response = await dio().put('/salon/addlike/$id');
    _like[id]=true;
    // _salons=response.data;
    print(response);
  }
  void deleteLike(int id) async{
    
    Dio.Response response = await dio().put('/salon/deletelike/$id');
    // _salons=response.data;
    _like[id]=false;
    print(response);
  }
}