import 'package:flutter/material.dart';
import 'package:flutter_laravel/screens/views/palatte.dart';
import 'package:flutter_laravel/screens/views/widgets.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:provider/provider.dart';
//import 'package:front_end/screens/views/rounded_button.dart';
//import 'package:flutter_laravel/services/auth.dart';
//import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
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
    _emailController.text = 'sarbone21@gmail.com';
    _passwordController.text = 'password';
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
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                 children: [
                  Container(
                    height:150,
                    child: Center(
                      child: Text('Login',style:kHeading,)),
                  ),
                  SizedBox(height:30,
                  ),
                  Container(
                    padding:const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(children: [
                      Container(
                        decoration:BoxDecoration(
                          color:Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextFormField(
                          controller: _emailController,
                          //  The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          decoration:InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 10),
                            border:InputBorder.none,
                            labelText:"Email",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(horizontal:20),
                              child: Icon( Icons.mail,color:Colors.white,size:20,),
                            ),
                            hintStyle: kBodyText, ),
                            style:kBodyText,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Container(
                        decoration:BoxDecoration(
                          color:Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextFormField(
                            controller: _passwordController,
                          //  The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter valid password';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration:InputDecoration(

                            contentPadding: const EdgeInsets.symmetric(vertical: 10),
                            border:InputBorder.none,
                            labelText:"Password",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(horizontal:20),
                              child: Icon( Icons.lock,color:Colors.white,size:20,),
                            ),
                            hintStyle: kBodyText, ),
                            style:kBodyText,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(height: 30.0,),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Map creds = {
                                'email': _emailController.text,
                                'password': _passwordController.text,
                                'device_name': 'mobile',
                              };
                              // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState.validate()) {
                    Provider.of<Auth>(context, listen: false)
                        .login(creds: creds);
                    Navigator.pop(context);
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
                          onPressed: () {},
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