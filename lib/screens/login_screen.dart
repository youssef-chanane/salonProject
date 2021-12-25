// ignore_for_file: avoid_print, prefer_final_fields, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_laravel/screens/signup_screen.dart';
import 'package:flutter_laravel/screens/views/palatte.dart';
import 'package:flutter_laravel/screens/views/widgets.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  get altButton => null;
  @override
  void initState() {
    _emailController.text = '';
    _passwordController.text = '';
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Center(
          child: Column(
            children: <Widget>[
              Image.asset(
                'images/logo.png',
                width: 230,
                height: 230,
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
                    height: 180,
                  ),
                  // Container(
                  //   height: 150,
                  //   child: Center(
                  //       child: Text(
                  //     'Login',
                  //     style: TextStyle(
                  //         fontSize: 50,
                  //         fontWeight: FontWeight.bold,
                  //         color: Color.fromARGB(255, 151, 151, 151)),
                  //   )),
                  // ),
                  SizedBox(
                    height: 30,
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),

            
                    child: Column(children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            errorStyle: TextStyle(
                              fontSize: 15,

                              //backgroundColor: Colors.transparent,
                              color: Colors.white,
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 5),
                            border: InputBorder.none,
                            labelText: "Email",
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
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
                          controller: _emailController,


                        ),
                      ),
                      const SizedBox(height: 40.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextFormField(
                          controller: _passwordController,

                          obscureText: true,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                              fontSize: 15,
                              backgroundColor: Colors.transparent,
                              color: Colors.white,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 10),
                            border: InputBorder.none,
                            labelText: "Password",
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
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
                              'email': _emailController.text,
                              'password': _passwordController.text,
                              'device_name': 'mobile',
                            };

                     if(await Provider.of<Auth>(context, listen: false)
                        .login(creds: creds)){
                          //information valid go to home page
                          print("true"); 
                          Navigator.pop(context);
                        }else{
                            //information invalid show alert
                            AlertDialog(
                              title: Text("error"),
                            );
                          print("enter valid information");
                        }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              "Login",
                              style: kBodyText,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don\'t you have an account?",
                                style: TextStyle(
                                  color: Colors.white,
                                )),

                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                              child: const Text("Register Now"),
                            ),
                          ]),
                    ]),
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