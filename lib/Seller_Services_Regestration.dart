import 'dart:convert';
import 'dart:ffi';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
import 'package:validation_extensions/validation_extensions.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ServicesRegestration extends StatefulWidget {
  @override
  _ServicesRegestrationState createState() => _ServicesRegestrationState();
}

class _ServicesRegestrationState extends State<ServicesRegestration> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController service = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController currency = TextEditingController();

  bool processing = false; //might dont need it

  @override
  void initState() {
    super.initState();
    service = new TextEditingController();
    price = new TextEditingController();
    currency = new TextEditingController();
  }

  void registerService() async {
    //setState(() {
    //  processing = true;
    //});

    var url = "https://sdp2021.000webhostapp.com/login_flutter/Services.php";
    var data = {
      "Service": service.text,
      "Price": price.text,
      "Currency": currency.text,
    };

    var res = await http.post(url, body: data);

    if (jsonDecode(res.body) == "Service Already Registered") {
      Fluttertoast.showToast(
          msg: "Error, Service Already Registered",
          toastLength: Toast.LENGTH_SHORT);
    } else {
      if (jsonDecode(res.body) == "true") {
        Fluttertoast.showToast(
            msg: "Service Registered", toastLength: Toast.LENGTH_SHORT);
      } else {
        Fluttertoast.showToast(msg: "Error", toastLength: Toast.LENGTH_SHORT);
      }
    }
    //setState(() {
    //processing = true;
    //});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Service Registration Page")),
        body: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color(0xFF8A2387),
                Color(0XFFE94057),
                Color(0XFFF27121),
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Container(
                height: 580,
                width: 330,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Please Fill the Required Information",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Form(
                      autovalidate: true,
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          //Padding(padding: EdgeInsets.all(10)),
                          TextFormField(
                            controller: service,
                            decoration: InputDecoration(
                              labelText: "Services",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            // the validator
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required Field"),
                            ]),
                          ),
                          //Padding(padding: EdgeInsets.all(10)),
                          SizedBox(height: 15.0),
                          TextFormField(
                            controller: price,
                            decoration: InputDecoration(
                              labelText: "Price",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            // the validator
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required Field"),
                            ]),
                          ),
                          //Padding(padding: EdgeInsets.all(10)),
                          SizedBox(height: 15.0),
                          TextFormField(
                            controller: currency,
                            decoration: InputDecoration(
                              labelText: "Currency",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            // the validator
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required Field"),
                            ]),
                          ),
                          SizedBox(height: 15.0),
                          RaisedButton(
                            child: processing == false
                                ? Text(
                                    "Register",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  )
                                : CircularProgressIndicator(
                                    backgroundColor: Colors.red),
                            onPressed: () => registerService(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
