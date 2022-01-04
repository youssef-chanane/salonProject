import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laravel/screens/form/barber_form.dart';
import 'package:flutter_laravel/screens/views/palatte.dart';
import 'package:flutter_laravel/screens/views/widgets.dart';
import 'package:flutter_laravel/services/salon.dart';
import 'package:flutter_laravel/services/service.dart';
import 'package:provider/provider.dart';

class ServicesForm extends StatefulWidget {
  const ServicesForm({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ServicesForm();
}

class _ServicesForm extends State<ServicesForm> {
  TextEditingController _titlecontroller = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  List<String> _errors = [' '];

  @override
  void initState() {
    _titlecontroller.text = '';
    _priceController.text = '';
    _descriptionController.text = '';

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
                Text('Upgrade Account', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 80,
                    child: Center(
                        child: Text(
                      'Barber Services',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
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
                            controller: _titlecontroller,
                            //validation
                            validator: (String value) {
                              // String pattern = r'(^[a-zA-Z ]*$)';
                              String pattern = r'(^([\s]*[\S]+).{0,249}$)';
                              RegExp regExp = new RegExp(pattern);
                              if (value.isEmpty) {
                                _errors.add("Service title is required");
                                return ' ';
                              } else if (!regExp.hasMatch(value)) {
                                _errors.add("Service title is required");
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
                              labelText: "Service title",
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(
                                  Icons.menu_book_sharp,
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
                                controller: _priceController,
                                //validation
                                validator: (String value) {
                                  // String pattern = r'(^[a-zA-Z ]*$)';
                                  // String pattern = r'(^[0-9]{1}$)';
                                  // RegExp regExp = new RegExp(pattern);
                                  if (value.isEmpty) {
                                    _errors.add("Price is required");
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
                                  labelText: "Price (dhs)",
                                  prefixIcon: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Icon(
                                      Icons.price_change_outlined,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  suffixIcon: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        child: Icon(
                                          Icons.monetization_on_outlined,
                                        ),
                                      )),
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
                                maxLines: null,
                                controller: _descriptionController,
                                //validation
                                validator: (String value) {
                                  // String pattern = r'(^[a-zA-Z ]*$)';
                                  String pattern = r'(^([\s]*[\S]+).{0,249}$)';
                                  RegExp regExp = new RegExp(pattern);
                                  if (value.isEmpty) {
                                    _errors.add("Description is required");
                                    return ' ';
                                  } else if (!regExp.hasMatch(value)) {
                                    _errors.add("Description is required");
                                    return ' ';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  border: InputBorder.none,
                                  labelText: "Description",
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Icon(
                                      Icons.description,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  hintStyle: kBodyText,
                                ),
                                style: kBodyText,
                                keyboardType: TextInputType.multiline,
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
                              child: Row(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blueGrey[300],
                                    ),
                                    onPressed: () {
                                      Map creds = {
                                        'title': _titlecontroller.text,
                                        'price': _priceController.text,
                                        'description':_descriptionController.text,
                                      };
                                      if (_formKey.currentState.validate()) {
                                        Provider.of<Service>(context, listen: false)
                                           .store(creds: creds);
                                        print(creds);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ServicesForm()));
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
                                        "Add Service",
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30.0,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 82, 87, 40),
                                    ),
                                    onPressed: () {
                                      Map creds = {
                                        'title': _titlecontroller.text,
                                        'price': _priceController.text,
                                        'description':
                                            _descriptionController.text,
                                      };
                                      if (_formKey.currentState.validate()) {
                                         Provider.of<Service>(context, listen: false)
                                           .store(creds: creds);
                                        print(creds);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BarberForm()));
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
                                        "barber informations",
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
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
