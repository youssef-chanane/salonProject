import 'package:flutter/material.dart';
import 'package:flutter_laravel/screens/login_screen.dart';
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a valid email';
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter valid password';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    backgroundColor: Colors.transparent,
                                    color: Colors.white,
                                  ),
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
                                // validator: (value) {
                                //   if (_password2Controller.text != _passwordController.text) {
                                //     return 'Please enter valid password';
                                //   }
                                //   return null;
                                // },
                                obscureText: true,
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    backgroundColor: Colors.transparent,
                                    color: Colors.white,
                                  ),
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
                                onPressed: () {
                                  Map creds = {
                                    'name': _namecontroller.text,
                                    'email': _emailController.text,
                                    'password': _passwordController.text,
                                    'confirm': _password2Controller.text,
                                  };
                                  // Validate returns true if the form is valid, or false otherwise.
                                  //if (_formKey.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  print(creds);
                                  //}
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