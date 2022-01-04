import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_laravel/screens/display/salons_screen.dart';
import 'package:flutter_laravel/screens/display/service_screen.dart';
import 'package:flutter_laravel/screens/form/barber_form.dart';
import 'package:flutter_laravel/screens/form/gallery_form.dart';
import 'package:flutter_laravel/screens/form/salon_form.dart';
import 'package:flutter_laravel/screens/form/service_form.dart';
import 'package:flutter_laravel/screens/login_screen.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:flutter_laravel/services/salon.dart';
import 'package:flutter_laravel/services/service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final storage = new FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    readToken();
  }

  void readToken() async {
    String token = await storage.read(key: 'token');
    Provider.of<Auth>(context, listen: false).tryToken(token: token);
    print(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Home Sceen'),
      ),
      drawer: Drawer(child: Consumer<Auth>(builder: (context, auth, child) {
        if (!auth.authenticated) {
          return ListView(
            children: [
              ListTile(
                title: Text('Login'),
                leading: Icon(Icons.login),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ],
          );
        } else {
          if(Auth.role==1){
              return ListView(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      auth.user.name,
                      
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      auth.user.email,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Salon Profile'),
                leading: Icon(Icons.home),
                onTap: () {
                  Provider.of<Service>(context,listen: false).show();
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => ServiceScreen()));
                },
              ),
              ListTile(
                title: Text('Add Image'),
                leading: Icon(Icons.add_a_photo_outlined),
                onTap: () {
                  
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => GalleryForm()));
                },
              ),
              ListTile(
                title: Text('Add service'),
                leading: Icon(Icons.list_rounded),
                onTap: () async {
                  await Provider.of<Salon>(context, listen: false)
                             .index();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ServicesForm()));
                },
              ),
               ListTile(
                title: Text('Add barber'),
                leading: Icon(Icons.add_box_outlined),
                onTap: () {
                  
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BarberForm()));
                },
              ),
              ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.logout),
                onTap: () {
                  Provider.of<Auth>(context, listen: false).logout();
                },
              ),
            ],
          );
          }else{

          return ListView(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      auth.user.name,
                      
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      auth.user.email,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
                ListTile(
                title: Text('change to salon'),
                leading: Icon(Icons.home),
                onTap: () {
                  
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SalonForm()));
                },
              ),
              ListTile(
                title: Text('Salons list'),
                leading: Icon(Icons.list_rounded),
                onTap: () async {
                  await Provider.of<Salon>(context, listen: false)
                             .index();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SalonsScreen()));
                },
              ),
               ListTile(
                title: Text('Contact us'),
                leading: Icon(Icons.contact_support_outlined),
                onTap: () {
                  
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => SalonForm()));
                },
              ),
              ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.logout),
                onTap: () {
                  Provider.of<Auth>(context, listen: false).logout();
                },
              ),
            ],
          );
          }
        }
      })),
    );
  }
}
