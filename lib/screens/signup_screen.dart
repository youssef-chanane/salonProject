import 'package:flutter/material.dart';
import 'package:flutter_laravel/screens/home_screen.dart';
import 'package:flutter_laravel/screens/login_screen.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:provider/provider.dart';
import 'views/palatte.dart';
import 'views/widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _password2Controller = TextEditingController();
  List<String> _errors=[' '];
    @override
  void initState() {
    _emailController.text = 'sarbone21@gmail.com';
    _namecontroller.text = 'youssef';
    _passwordController.text = '1234';
    _password2Controller.text = '1234';

    super.initState();
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Center(
          child: Column(
            children: <Widget>[
              Image.asset(
                'images/logo.png',
                width: 210,
                height: 210,
              ),
            ],
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 160,
                  ),
                  // Container(
                  //   height: 130,
                  //   child: Center(
                  //       child: Text(
                  //     'Sign Up',
                  //     style: TextStyle(
                  //         fontSize: 50,
                  //         fontWeight: FontWeight.bold,
                  //         color: Color.fromARGB(255, 151, 151, 151)),
                  //   )),
                  // ),
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

                            //validation
                            validator: (String value) {
                              // String pattern = r'(^[a-zA-Z ]*$)';
                              String pattern = r'(^([\s]*[\S]+).{0,249}$)';
                              RegExp regExp = new RegExp(pattern);
                              if (value.isEmpty) {
                                _errors.add("Username is required");
                                return ' ';
                              } else if (!regExp.hasMatch(value)) {
                                _errors.add("Username is required");
                                return ' ';
                              }
                              return null;
                            },
                            controller: _namecontroller,
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
                              labelText: "Name",
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
                                controller: _emailController,

                                //  The validator receives the text that the user has entered.
                                validator: (String value) {
                                  String pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regExp = new RegExp(pattern);
                                  if (value.isEmpty) {
                                    _errors.add("Email is required");
                                    return '';
                                  } else if (!regExp.hasMatch(value)) {
                                    _errors.add("Invalid email");
                                    return '';
                                  } else {
                                    return null;
                                  }
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
                                  labelText: "Email",
                                  prefixIcon: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Icon(
                                      Icons.mail,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  hintStyle: kBodyText,
                                ),
                                style: kBodyText,
                                keyboardType: TextInputType.emailAddress,
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
                                controller: _passwordController,
                                //  The validator receives the text that the user has entered.
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    _errors.add('Password is required');
                                    return '';
                                  } else if (value.length < 4) {
                                    _errors.add('Password must be at least 4 characters');
                                    return '';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  border: InputBorder.none,
                                  labelText: "Password",
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Icon(
                                      Icons.lock,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  hintStyle: kBodyText,
                                ),
                                style: kBodyText,
                                keyboardType: TextInputType.visiblePassword,
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
                              child: TextFormField(
                                controller: _password2Controller,
                                //  The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == _passwordController.text) {
                                    return null;
                                  }else{
                                    _errors.add('passwords didn\'t match.');
                                    return '';
                                  }
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  border: InputBorder.none,
                                  labelText: "Confirm Password",
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Icon(
                                      Icons.lock,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  hintStyle: kBodyText,
                                ),
                                style: kBodyText,
                                keyboardType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ElevatedButton(
                                onPressed: () async {
                                  Map creds = {
                                    'name': _namecontroller.text,
                                    'email': _emailController.text,
                                    'password': _passwordController.text,
                                  };
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                      if(await Provider.of<Auth>(context, listen: false)
                                        .store(creds: creds)){
                                          Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                              HomeScreen()));
                                        }else{
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                  backgroundColor: Colors.white.withOpacity(0.7),
                                                  title: Text('Error', style:TextStyle(color: Colors.red), textAlign: TextAlign.center,),
                                                  content: Text(
                                                      'Email already exists,try another one', style:TextStyle(color: Colors.red),),
                                                  actions: <Widget>[
                                                    RaisedButton(
                                                        color: Colors.white.withOpacity(0.4),
                                                        child: Text('OK',),
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        })
                                                  ]
                                                 
                                              );
                                            }
                                          );
                                        }
                                        
                                         
                                    } else {
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
                                            }
                                          );
                                      setState(() {
                                      print(_errors);
                                      _errors.clear();
                                    });

                                    }
                                  },
                                
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: Text(
                                    "Sign Up",
                                    style: kBodyText,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Do you have an account?",
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()));
                                    },
                                    child: const Text("Sign in"),
                                  ),
                                ]),
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