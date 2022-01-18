// import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_laravel/screens/home_screen.dart';
import 'package:flutter_laravel/screens/views/widgets.dart';
import 'package:flutter_laravel/services/gallery.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class GalleryForm extends StatefulWidget {
  const GalleryForm({ Key key }) : super(key: key);

  @override
  _GalleryFormState createState() => _GalleryFormState();
}

class _GalleryFormState extends State<GalleryForm> {
  File uploadimage; //variable for choosed file

  Future<void> chooseImage() async {
        final choosedimage = await ImagePicker.pickImage(source: ImageSource.gallery);

        //set source: ImageSource.camera to get image from camera

        setState(() {
            uploadimage = File(choosedimage.path);
        });
  }
  Future<void> takePicture() async {
        final choosedimage = await ImagePicker.pickImage(source: ImageSource.camera);
        //set source: ImageSource.camera to get image from camera

        setState(() {
            uploadimage = File(choosedimage.path);
        });
  }
  @override
  Widget build(BuildContext context) {
       return Stack(
         children: [
              const BackgroundImage2(),
           Scaffold(
             backgroundColor: Colors.transparent,
              appBar: AppBar(
                leading: BackButton(),
                title:
                    Text('Gallery', style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.black,
                
              ),
             body:Center(
               child: Container(
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20),
                    ),
                   height:350,
                   width: 300,
                   alignment: Alignment.center,
                   child:Column(
                          
                          mainAxisAlignment: MainAxisAlignment.center, //content alignment to center 
                          children: <Widget>[
                          
                              Container(  //show image here after choosing image
                                  child:uploadimage == null? 
                                     Container(): //if uploadimage is null then show empty container
                                     Container(   //elese show image here
                                        child: SizedBox( 
                                           height:150,
                                           child:Image.file(uploadimage) //load image from file
                                        )
                                     )
                              ),

                              Container( 
                                width: 163,

                                  //show upload button after choosing image
                                child:uploadimage == null? 
                                     Container(): //if uploadimage is null then show empty container
                                     Container(   //elese show uplaod button
                                        child:RaisedButton.icon(
                                          onPressed: (){
                                            // print(uploadimage);
                                            Provider.of<Gallery>(context, listen: false)
                                               .store(uploadimage.path);
                                            Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen()));
                                          }, 
                                          icon: Icon(Icons.file_upload), 
                                          label: Text("UPLOAD IMAGE"),
                                          color: Colors.blueGrey[300],
                                          colorBrightness: Brightness.dark,
                                          
                                        )
                                     ) 
                              ),

                              Container(
                                width: 163,
                                child: RaisedButton.icon(
                                  onPressed: (){
                                      chooseImage(); // call choose image function
                                  },
                                  icon:Icon(Icons.folder_open),
                                  label: Text("CHOOSE IMAGE"),
                                  color: Colors.blueGrey[300],
                                  colorBrightness: Brightness.dark,
                                ),
                              ),
                              Container(
                                width: 163,
                                child: RaisedButton.icon(
                                  onPressed: (){
                                      takePicture(); // call choose image function
                                  },
                                  icon:Icon(Icons.camera_alt),
                                  label: Text("TAKE PICTURE"),
                                  color: Colors.blueGrey[300],
                                  colorBrightness: Brightness.dark,
                                ),
                              )
                    ],),
                ),
             ),
    ),
         ],
       );
    
  }
}