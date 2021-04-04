import 'dart:convert';
import 'dart:ffi';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
import 'package:validation_extensions/validation_extensions.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CusReg extends StatefulWidget {
  @override
  _CusRegState createState() => _CusRegState();
}

class _CusRegState extends State<CusReg> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController namectrl = TextEditingController();
  TextEditingController emailctrl = TextEditingController();
  TextEditingController agectrl = TextEditingController();
  TextEditingController phonectrl = TextEditingController();
  TextEditingController passwordctrl = TextEditingController();

  bool processing = false; //might dont need it

  @override
  void initState() {
    super.initState();
    namectrl = new TextEditingController();
    emailctrl = new TextEditingController();
    agectrl = new TextEditingController();
    phonectrl = new TextEditingController();
    passwordctrl = new TextEditingController();
  }

  void registerUser() async {
    setState(() {
      processing = true;
    });

    var url = "https://sdp2021.000webhostapp.com/login_flutter/regpage.php";
    var data = {
      "name": namectrl.text,
      "email": emailctrl.text,
      "age": agectrl.text,
      "phone_number": phonectrl.text,
      "password": passwordctrl.text,
    };

    var res = await http.post(url, body: data);

    if (jsonDecode(res.body) == "account already exists") {
      Fluttertoast.showToast(
          msg: "account exists, please login insted",
          toastLength: Toast.LENGTH_SHORT);
    } else {
      if (jsonDecode(res.body) == "true") {
        Fluttertoast.showToast(
            msg: "account created", toastLength: Toast.LENGTH_SHORT);
      } else {
        Fluttertoast.showToast(msg: "error", toastLength: Toast.LENGTH_SHORT);
      }
    }
    setState(() {
      processing = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Customer Registration Page")),
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
                            controller: namectrl,
                            decoration: InputDecoration(
                              labelText: "Name",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.name,
                            // the validator
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required Field"),
                            ]),
                          ),
                          //Padding(padding: EdgeInsets.all(10)),
                          SizedBox(height: 15.0),
                          TextFormField(
                            controller: emailctrl,
                            decoration: InputDecoration(
                              labelText: "Email",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            // the validator
                            validator: MultiValidator([
                              EmailValidator(errorText: "Not A Valid Email"),
                              RequiredValidator(errorText: "Required Field"),
                            ]),
                          ),
                          //Padding(padding: EdgeInsets.all(10)),
                          SizedBox(height: 15.0),
                          TextFormField(
                            controller: agectrl,
                            decoration: InputDecoration(
                              labelText: "Age",
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
                              MaxLengthValidator(3,
                                  errorText: "Is Not A Valid Age"),
                              MinLengthValidator(2,
                                  errorText: "Is Not A Valid Age"),
                              RequiredValidator(errorText: "Required Field"),
                            ]),
                          ),
                          //Padding(padding: EdgeInsets.all(10)),
                          SizedBox(height: 15.0),
                          TextFormField(
                            controller: phonectrl,
                            decoration: InputDecoration(
                              labelText: "Phone Number",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.phone,
                            // the validator
                            validator: MultiValidator([
                              MaxLengthValidator(10,
                                  errorText: "Invalid Phone Number"),
                              RequiredValidator(errorText: "Required Field"),
                            ]),
                          ),
                          //Padding(padding: EdgeInsets.all(10)),
                          SizedBox(height: 15.0),
                          TextFormField(
                            controller: passwordctrl,
                            decoration: InputDecoration(
                              labelText: "Password",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            // the validator
                            validator: MultiValidator([
                              MaxLengthValidator(15,
                                  errorText:
                                      "Password Shouldn't be More Than 15 Charecters"),
                              MinLengthValidator(6,
                                  errorText:
                                      "Password Shouldn't be Less Than 6 Charecters"),
                              RequiredValidator(errorText: "Required Field"),
                            ]),
                          ),
                          //Padding(padding: EdgeInsets.all(10)),
                          //confirmation password code
                          /*SizedBox(height: 15.0),
                          TextFormField(
                            //controller: emiratesidController,
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.name,
                            obscureText: true,
                            // the validator
                            validator: MultiValidator([
                              MaxLengthValidator(10, errorText: "null"),
                              MinLengthValidator(7, errorText: "null"),
                              RequiredValidator(errorText: "Required Field"),
                            ]),
                          ),*/
                          //Padding(padding: EdgeInsets.all(10)),
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
                            onPressed: () => registerUser(),
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
