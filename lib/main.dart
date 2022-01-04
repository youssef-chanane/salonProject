// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_laravel/screens/display/salons_screen.dart';
import 'package:flutter_laravel/screens/form/gallery_form.dart';
import 'package:flutter_laravel/screens/form/service_form.dart';
import 'package:flutter_laravel/screens/home_screen.dart';
import 'package:flutter_laravel/screens/login_screen.dart';
import 'package:flutter_laravel/screens/map_screen.dart';
import 'package:flutter_laravel/screens/form/salon_form.dart';
import 'package:flutter_laravel/screens/signup_screen.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:flutter_laravel/services/barber.dart';
import 'package:flutter_laravel/services/gallery.dart';
import 'package:flutter_laravel/services/salon.dart';
import 'package:flutter_laravel/services/service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
        ChangeNotifierProvider(create: (context) => Salon()),
        ChangeNotifierProvider(create: (context)=>Gallery()),
        ChangeNotifierProvider(create: (context)=>Barber()),
        ChangeNotifierProvider(create: (context)=>Service()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}
