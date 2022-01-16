import 'package:flutter/material.dart';

import 'views/widgets.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ContactScreen();
}

class _ContactScreen extends State<ContactScreen> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _messagecontroller = TextEditingController();
  List<String> _errors = [' '];

  void initState() {
    _emailcontroller.text = '';
    _messagecontroller.text = '';

    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage2(),
        Scaffold(
          appBar: AppBar(
            leading: BackButton(),
            title:
                Text('Contact Us', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 100,
                    child: Center(
                        child: Text(
                      'Contact Us',
                      style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: TextFormField(
                            controller: _emailcontroller,
                            //validation
                            validator: (String value) {
                              // String pattern = r'(^[a-zA-Z ]*$)';
                              String pattern = r'(^([\s]*[\S]+).{0,249}$)';
                              RegExp regExp = new RegExp(pattern);
                              if (value.isEmpty) {
                                _errors.add("Email is required");
                                return ' ';
                              } else if (!regExp.hasMatch(value)) {
                                _errors.add("Email is required");
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
                              hintText: "Email",
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              // hintStyle: kBodyText,
                            ),
                            // style: kBodyText,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        SizedBox(
                          height: 40,
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
                                controller: _messagecontroller,
                                maxLines: 6,
                                //validation
                                validator: (String value) {
                                  // String pattern = r'(^[a-zA-Z ]*$)';
                                  String pattern = r'(^[0-9]{1}$)';
                                  RegExp regExp = new RegExp(pattern);
                                  if (value.isEmpty) {
                                    _errors.add("Message is required");
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
                                  hintText: "Message",
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  prefixIcon: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Icon(
                                      Icons.message,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  // hintStyle: kBodyText,
                                ),
                                // style: kBodyText,

                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                            SizedBox(
                              height: 30,
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
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blueGrey[300],
                                    ),
                                    onPressed: () {
                                      Map creds = {
                                        'email': _emailcontroller.text,
                                        'message': _messagecontroller.text,
                                      };
                                      if (_formKey.currentState.validate()) {
                                        print(creds);
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             ()));
                                      } else {
                                        print(_errors);
                                        print(_errors.join("\n"));
                                        String err = _errors.join("\n");
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                  backgroundColor: Colors.white
                                                      .withOpacity(0.7),
                                                  title: Text(
                                                    'Error',
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  content: Text(
                                                    err,
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    RaisedButton(
                                                        color: Colors.white
                                                            .withOpacity(0.4),
                                                        child: Text(
                                                          'OK',
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        })
                                                  ]);
                                            });
                                      }

                                      setState(() {
                                        print(_errors);
                                        _errors.clear();
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: Text(
                                        "Send",
                                        style: TextStyle(
                                          fontSize: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30.0,
                                  ),
                                ],
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
