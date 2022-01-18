import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laravel/screens/display/barber_screen.dart';
import 'package:flutter_laravel/screens/display/images_screen.dart';
import 'package:flutter_laravel/screens/display/reservation_screen.dart';
import 'package:flutter_laravel/screens/display/service_screen.dart';
import 'package:flutter_laravel/services/barber.dart';
import 'package:flutter_laravel/services/gallery.dart';
import 'package:flutter_laravel/services/reserver.dart';
import 'package:flutter_laravel/services/service.dart';
import 'package:provider/provider.dart';

class NavBottom extends StatelessWidget {
  final stylist;
  NavBottom(this.stylist);

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.orange[50],
            height: 60,
            labelTextStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          child: NavigationBar(
            backgroundColor: Colors.orange[50],
            destinations: [
              InkWell(
                  child: Icon(
                    Icons.list_rounded,
                    color: Colors.grey,
                  ),
                  onTap: ()async {
                    await Provider.of<Service>(context,listen: false).show(stylist["user_id"]);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ServiceScreen(stylist)));
                  }),
              InkWell(
                  child: Icon(
                    Icons.photo_size_select_actual,
                    color: Colors.grey,
                  ),
                  onTap: () async {
                    await Provider.of<Gallery>(context,listen: false).show(stylist["user_id"]);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GalleryScreen(stylist)));
                  }),
              InkWell(
                  child: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  onTap: () async {
                    
                    await Provider.of<Barber>(context,listen: false).show(stylist['user_id']);
                    var barbers =Provider.of<Barber>(context,listen: false).barbers;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BarberScreen(stylist,barbers)));
                  }),
              InkWell(
                  child: Icon(
                    Icons.chat,
                    color: Colors.grey,
                  ),
                  onTap: () async {
                    await Provider.of<Reserver>(context,listen: false).show(stylist['user_id']);
                    var reservationList=Provider.of<Reserver>(context, listen: false).reservations;

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ReservationScreen(stylist,reservationList)));
                  }),
            ],
          ),
        );
  }
}