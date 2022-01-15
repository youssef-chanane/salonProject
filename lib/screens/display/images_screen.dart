import 'package:flutter/material.dart';
import 'package:flutter_laravel/screens/display/service_screen.dart';
import 'package:flutter_laravel/services/barber.dart';
import 'package:flutter_laravel/services/gallery.dart';
import 'package:flutter_laravel/services/service.dart';
import 'package:provider/provider.dart';

import 'barber_screen.dart';

// import 'details.dart';

var _images = Gallery.images;

class GalleryScreen extends StatelessWidget {
  final stylist;
  GalleryScreen(this.stylist);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
      backgroundColor: Color.fromARGB(255, 16, 59, 80),
      
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
              Positioned(
                top: 50,
                left: 20,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Gallery',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return RawMaterialButton(
                      onPressed: ()  {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => DetailsPage(
                        //       imagePath: _images[index].imagePath,
                        //       index: index,
                        //     ),
                        //   ),
                        // );
                      },
                      child: Hero(
                        tag: 'logo$index',
                        child: Container(child:  Image.network("http://10.0.2.2:8000/storage/"+_images[index]['url'])),
                        // child: Container(
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(15),
                        //     image: DecorationImage(
                        //       image: Image.network("http://10.0.2.2:8000/storage/"+_images[index]['url']),
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        // ),
                      ),
                    );
                  },
                  itemCount: _images.length,
                ),
                
              ),
              
            ),

          ],
        ),
      ),
       bottomNavigationBar: NavigationBarTheme(
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
                  onTap: () async {
                    await Provider.of<Service>(context,listen: false).show(stylist['user_id']);
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BarberScreen(stylist)));
                  }),
              InkWell(
                  child: Icon(
                    Icons.chat,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GalleryScreen(stylist)));
                  }),
            ],
          ),
        ),
    );
  }
}

class ImageDetails {
  final String imagePath;
  ImageDetails({
    @required this.imagePath,
  });
}




// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_laravel/screens/display/barber_screen.dart';
// import 'package:flutter_laravel/screens/display/salons_screen.dart';
// import 'package:flutter_laravel/screens/display/service_screen.dart';
// import 'package:flutter_laravel/services/barber.dart';
// import 'package:flutter_laravel/services/gallery.dart';
// // import 'package:flutter_laravel/screens/views/navbar.dart';
// import 'package:flutter_laravel/services/service.dart';
// import 'package:provider/provider.dart';
// //import 'package:outline_material_icons/outline_material_icons.dart';

// // var imagesList = [
// //   {'title': 'Men\s Hair Cut', 'duration': 45, 'price': 30},
// //   {'title': 'Women\s Hair Cut', 'duration': 60, 'price': 50},
// //   {'title': 'Color & Blow Dry', 'duration': 90, 'price': 75},
// //   {'title': 'Oil Treatment', 'duration': 30, 'price': 20},
// // ];
// var imagesList=Gallery.images;
// class GalleryScreen extends StatelessWidget {
//   final stylist;
//   // var i=0;


//   GalleryScreen(this.stylist);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           child: Stack(
//             children: <Widget>[
//               Container(
//                 height: MediaQuery.of(context).size.height / 3 + 20,
//                 width: MediaQuery.of(context).size.width,
//                 child: Stack(
//                   fit: StackFit.expand,
//                   children: <Widget>[
//                     Image.asset(
//                       'images/detail_bg.png',
//                       fit: BoxFit.fill,
//                     ),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 top: 50,
//                 left: 20,
//                 child: IconButton(
//                   icon: Icon(
//                     Icons.arrow_back_ios,
//                     color: Colors.white,
//                   ),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//               ),
//               Positioned(
//                 top: MediaQuery.of(context).size.height / 3 - 35,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(50),
//                     ),
//                   ),
                  
//                   child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
//                     child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                             height: 80,
//                             ),
//                           Text(
//                             'Images List',
//                             style: TextStyle(
                              
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                               color: Color.fromARGB(255, 80, 135, 156),
//                             ),
//                             ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
                          
//                           child: Column(
                            
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: List.generate(imagesList.length,(i)=> GalleryTile(imagesList[i])),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: MediaQuery.of(context).size.height / 3 - 120,
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 30),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: <Widget>[
//                       Container(
//                         width: MediaQuery.of(context).size.width / 10 - 20,
//                         height: MediaQuery.of(context).size.height / 6 + 25,
//                       ),
//                       SizedBox(
//                         width: 20,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
                        
//                         children: <Widget>[
//                           SizedBox(height: 90),
//                           Text(
//                             stylist['salon_name'],
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 30,
//                             ),
//                           ),
//                           SizedBox(height: 10),
//                           Text(
//                             stylist['phone'],
//                             style: TextStyle(
//                               color: Colors.blueGrey,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           // SizedBox(
//                           //   height: 10,
//                           // ),
//                           // Row(
//                           //   children: <Widget>[
//                           //     Icon(
//                           //       Icons.star,
//                           //       size: 16,
//                           //       color: Color(0xffFF8573),
//                           //     ),
//                           //     SizedBox(height: 5),
//                           //     Text(
//                           //       stylist['rating'],
//                           //       style: TextStyle(
//                           //         color: Color(0xffFF8573),
//                           //       ),
//                           //     ),
//                           //   ],
//                           // ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 right: 10,
//                 top: MediaQuery.of(context).size.height / 3 - 55,
//                 child: MaterialButton(
//                   onPressed: () {},
//                   padding: EdgeInsets.all(10),
//                   shape: CircleBorder(),
//                   color: Colors.white,
//                   child: Icon(Icons.thumb_up),
//                 ),
//               ),
//               Positioned(
//                 right: 10,
//                 top: MediaQuery.of(context).size.height / 3 - 55,
//                 child: MaterialButton(
//                   onPressed: () {

//                   },
//                   padding: EdgeInsets.all(10),
//                   shape: CircleBorder(),
//                   color: Colors.white,
//                   child: Icon(Icons.thumb_up_alt_outlined),
//                 ),
//               ),

//             ],
//           ),
//         ),
//       ),
//         bottomNavigationBar: NavigationBarTheme(
//           data: NavigationBarThemeData(
//             indicatorColor: Colors.orange[50],
//             height: 60,
//             labelTextStyle: MaterialStateProperty.all(
//               TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//             ),
//           ),
//           child: NavigationBar(
//             backgroundColor: Colors.orange[50],
//             destinations: [
//               InkWell(
//                   child: Icon(
//                     Icons.list_rounded,
//                     color: Colors.grey,
//                   ),
//                   onTap: () async {
//                     await Provider.of<Service>(context,listen: false).show(stylist['user_id']);
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => ServiceScreen(stylist)));
//                   }),
//               InkWell(
//                   child: Icon(
//                     Icons.photo_size_select_actual,
//                     color: Colors.grey,
//                   ),
//                   onTap: () {
//                     // Navigator.push(context,
//                     //     MaterialPageRoute(builder: (context) => SignUp()));
//                   }),
//               InkWell(
//                   child: Icon(
//                     Icons.person,
//                     color: Colors.grey,
//                   ),
//                   onTap: () async {
                    
//                     await Provider.of<Barber>(context,listen: false).show(stylist['user_id']);
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => BarberScreen(stylist)));
//                   }),
//               InkWell(
//                   child: Icon(
//                     Icons.chat,
//                     color: Colors.grey,
//                   ),
//                   onTap: () {
//                     // print(imagesList1);
//                     // Navigator.push(context,
//                     //     MaterialPageRoute(builder: (context) => SignUp()));
//                   }),
//             ],
//           ),
//         ),
//     );
//   }
// }

// class GalleryTile extends StatelessWidget {
//   final image;
//   GalleryTile(this.image);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 30),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[

//               SizedBox(
//                 height: 10,
//               ),
//               Container(   //elese show image here
//                  child: SizedBox( 
//                     child:Image.network("http://10.0.2.2:8000/storage/"+image['url'],width: 200,height: 200,) //load image from file
//                  )
//               ),
//             ],
//           ),
          
          
//         ],
//       ),
//     );
//   }
// }
