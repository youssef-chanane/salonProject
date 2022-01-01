// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_laravel/screens/barber/gallery_form.dart';
import 'package:flutter_laravel/screens/barber/service_form.dart';
import 'package:flutter_laravel/screens/home_screen.dart';
import 'package:flutter_laravel/screens/login_screen.dart';
import 'package:flutter_laravel/screens/map_screen.dart';
import 'package:flutter_laravel/screens/barber/salon_form.dart';
import 'package:flutter_laravel/screens/signup_screen.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:flutter_laravel/services/gallery.dart';
import 'package:flutter_laravel/services/salon.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
        ChangeNotifierProvider(create: (context) => Salon()),
        ChangeNotifierProvider(create: (context)=>Gallery()),
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
      home: LoginScreen(),
    );
  }
}
