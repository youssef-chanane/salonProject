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
      body:  Container(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(250, 249, 249, 249),
                        // color: Color(0xffFFF0EB),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 700,
                            ),
                            Center(
                              child: Text(
                                'Find Salon Nearby',
                                style: TextStyle(
                                  fontSize: 46,
                                  fontFamily: 'Cursive',
                                  color: Color.fromARGB(255, 161, 18, 18),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                RichText(
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 18),
                                        children: [
                                          TextSpan(
                                              text:
                                                  "Find the best barbershop in your area.\n"),
                                          TextSpan(
                                              text:
                                                  "The barber provides you the most popular barbers near you.")
                                        ])),
                                Container(
                                  child: Image.asset(
                                    'images/second.jpg',
                                    fit: BoxFit.fill,
                                    width: 260,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            RichText(
                                softWrap: true,
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 143, 89, 89),
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Cursive',
                                    ),
                                    children: [
                                      TextSpan(
                                          text:
                                              "It was never easier and faster to stay connected with your customers. Now you can do it directly from this barber app."),
                                    ])),
                            SizedBox(
                              height: 50,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Container(
                                    width: 150,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'images/img3.jpg',
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 150,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'images/img2.jpg',
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 150,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'images/img1.jpg',
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 150,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'images/img4.jpg',
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 150,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'images/first.jpg',
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 150,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'images/5.jpg',
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 150,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'images/3.jpg',
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Center(
                                      child: Text(
                                        'Top 3 Salons',
                                        style: TextStyle(
                                          fontFamily: 'Cursive',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 45,
                                          color:
                                              Color.fromARGB(255, 120, 89, 146),
                                        ),
                                      ),
                                    ),
                                    // StylistCard(stylistData[0]),
                                    // StylistCard(stylistData[1]),
                                    // StylistCard(stylistData[2]),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SocialIcon(
                                  iconSrc: "images/facebook.png",
                                  press: () {},
                                ),
                                SocialIcon(
                                  iconSrc: "images/instagram.png",
                                  press: () {},
                                ),
                                SocialIcon(
                                  iconSrc: "images/twitter.png",
                                  press: () {},
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
          if(Auth.role==2){
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
                  // Provider.of<Service>(context,listen: false).show();
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
class SocialIcon extends StatelessWidget {
  final String iconSrc;
  final Function press;
  const SocialIcon({
    Key key,
    this.iconSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        child: Image.asset(
          iconSrc,
          height: 30,
          width: 30,
        ),
      ),
    );
  }
}
