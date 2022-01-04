import 'package:flutter/material.dart';
import 'package:flutter_laravel/screens/display/service_screen.dart';
import 'package:flutter_laravel/screens/form/barber_form.dart';
import 'package:flutter_laravel/screens/views/widgets.dart';
import 'package:flutter_laravel/services/salon.dart';
import 'package:flutter_laravel/services/service.dart';
import 'package:provider/provider.dart';

// import '../view.dart';
var salons=Salon.salons;
// const stylistData = [
//   {
//     'stylistName': 'Cameron Jones',
//     'salonName': 'Super Cut Salon',
//     'rating': '4.8',
//     'rateAmount': '56',
//     'imgUrl': 'images/stylist1.png',
//     'bgColor': Color(0xffFFF0EB),
//   },
//   {
//     'stylistName': 'Max Robertson',
//     'salonName': 'Rossano Ferretti Salon',
//     'rating': '4.7',
//     'rateAmount': '80',
//     'imgUrl': 'images/stylist2.png',
//     'bgColor': Color(0xffEBF6FF),
//   },
//   {
//     'stylistName': 'Beth Watson',
//     'salonName': 'Neville Hair and Beauty',
//     'rating': '4.7',
//     'rateAmount': '70',
//     'imgUrl': 'images/stylist3.png',
//     'bgColor': Color(0xffFFF3EB),
//   }
// ];

class SalonsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage2(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        BackButton(
                            color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    // height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                              SizedBox(
                                height: 50,
                              ),
                              Text(
                                'Salons',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: 

                              List.generate(salons.length,(i)=> StylistCard(salons[i]))

                              // StylistCard(salons[0]),
                              // StylistCard(salons[1]),
                              // StylistCard(salons[2]),
                            
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class StylistCard extends StatelessWidget {
  final stylist;
  StylistCard(this.stylist);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 200 ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xffFFF0EB),
      ),
      child: Stack(
        children: <Widget>[
          // Positioned(
          //   top: 20,
          //   right: -50,
          //   child: Image.asset(
          //     stylist['imgUrl'],
          //     width: MediaQuery.of(context).size.width * 0.60,
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.only(top: 40, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  stylist['salon_name'],
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Text(
                  stylist['phone'],
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    print(Salon.salons);
                    Provider.of<Service>(context,listen: false).show();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ServiceScreen(stylist)));
                  },
                  color: Color(0xff4E295B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'View Profile',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
