import 'package:flutter/material.dart';
import 'package:flutter_laravel/screens/barber/service_form.dart';
import 'package:flutter_laravel/screens/home_screen.dart';
import 'package:flutter_laravel/screens/views/palatte.dart';
import 'package:flutter_laravel/screens/views/widgets.dart';
import 'package:flutter_laravel/services/auth.dart';
// import 'package:flutter_laravel/services/auth.dart';
import 'package:flutter_laravel/services/salon.dart';
import 'package:provider/provider.dart';


class SalonForm extends StatefulWidget {
  const SalonForm({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SalonForm();
}

class _SalonForm extends State<SalonForm> {
  TextEditingController _salonnamecontroller = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  List<String> _errors=[' '];

    @override
  void initState() {
    _salonnamecontroller.text = 'bogsni';
    _numberController.text = '3';
    _phoneController.text = '0611771354';

    super.initState();
  }
    final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          appBar: AppBar(
            title:
                Text('Upgrade Account', style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.grey[200],
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Form(
              key:_formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 80,
                    child: Center(
                        child: Text(
                      'Upgrade to salon',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 151, 151, 151)),
                    )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: TextFormField(
                            controller: _salonnamecontroller,
                            //validation
                            validator: (String value) {
                              // String pattern = r'(^[a-zA-Z ]*$)';
                              String pattern = r'(^([\s]*[\S]+).{0,249}$)';
                              RegExp regExp = new RegExp(pattern);
                              if (value.isEmpty) {
                                _errors.add("Salon name is required");
                                return ' ';
                              } else if (!regExp.hasMatch(value)) {
                                _errors.add("salon name is required");
                                return ' ';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.transparent,
                              errorStyle: TextStyle(
                                height: 0,
                                fontSize: 15,

                                //backgroundColor: Colors.transparent,
                                color: Colors.white,
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              border: InputBorder.none,
                              labelText: "Salon Name",
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Column(children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: TextFormField(
                            controller: _numberController,
                            //validation
                            validator: (String value) {
                              // String pattern = r'(^[a-zA-Z ]*$)';
                              String pattern = r'(^[0-9]{1}$)';
                              RegExp regExp = new RegExp(pattern);
                              if (value.isEmpty) {
                                _errors.add("number of barber is required");
                                return ' ';
                              } else if (!regExp.hasMatch(value)) {
                                _errors.add("number of barber can't more than 9");
                                return ' ';
                              }
                              return null;
                            },
                            
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  errorStyle: TextStyle(
                                    height: 0,
                                    fontSize: 15,

                                    //backgroundColor: Colors.transparent,
                                    color: Colors.white,
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 5),
                                  border: InputBorder.none,
                                  labelText: "Number of Barbers",
                                  prefixIcon: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Icon(
                                      Icons.bubble_chart_outlined,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  hintStyle: kBodyText,
                                ),
                                style: kBodyText,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: TextFormField(
                              controller: _phoneController,
                            //validation
                            validator: (String value) {
                              // String pattern = r'(^[a-zA-Z ]*$)';
                              String pattern = r'(^[0-9]{10}$)';
                              RegExp regExp = new RegExp(pattern);
                              if (value.isEmpty) {
                                _errors.add("phone number is requied");
                                return ' ';
                              } else if (!regExp.hasMatch(value)) {
                                _errors.add("Enter a correct phone number");
                                return ' ';
                              }
                              return null;
                            },
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  border: InputBorder.none,
                                  labelText: "Phone Number",
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Icon(
                                      Icons.call,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  hintStyle: kBodyText,
                                ),
                                style: kBodyText,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ElevatedButton(
                                onPressed: ()  {

                                  Map creds = {
                                    'salon_name': _salonnamecontroller.text,
                                    'nb_barber': _numberController.text,
                                    'phone': _phoneController.text,
                                  };
                                  if(_formKey.currentState.validate()){
                                    Provider.of<Salon>(context, listen: false)
                                        .store(creds: creds);
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ServicesScreen()));
                                        print(creds);
                                  }else{
                                    print(_errors);  
                                    print(_errors.join("\n"));
                                      String err=_errors.join("\n");
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                  backgroundColor: Colors.white.withOpacity(0.7),
                                                  title: Text('Error', style:TextStyle(color: Colors.red), textAlign: TextAlign.center,),
                                                  content: Text(
                                                      err, style:TextStyle(
                                                        color: Colors.red,
                                                        
                                                        ),),
                                                  actions: <Widget>[
                                                    RaisedButton(
                                                        color: Colors.white.withOpacity(0.4),
                                                        child: Text('OK',),
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        })
                                                  ]
                                                 
                                              );
                                            });
                                            }
                                  
                                      setState(() {
                                      print(_errors);
                                      _errors.clear();
                                    });

                                    
                                  },
                                  child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: Text(
                                    "Upgrade to Salon",
                                    style: kBodyText,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ],
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
