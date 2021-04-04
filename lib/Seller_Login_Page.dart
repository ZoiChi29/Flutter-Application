import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:sdp/Customer_Regestration_Page.dart';
import 'package:flutter/services.dart';
import 'package:sdp/Seller_Regestration_Page.dart';

class sellerLoginPage extends StatefulWidget {
  @override
  _sellerLoginPageState createState() => _sellerLoginPageState();
}

class _sellerLoginPageState extends State<sellerLoginPage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController emailctrl = TextEditingController();
  TextEditingController passwordctrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailctrl = new TextEditingController();
    passwordctrl = new TextEditingController();
  }

  Future sellerLogin() async {
    var url = "https://sdp2021.000webhostapp.com/login_flutter/sellerLogin.php";
    var data = {
      "email": emailctrl.text,
      "password": passwordctrl.text,
    };
    var res = await http.post(url, body: data);

    if (json.decode(res.body) == "Invalid Email") {
      Fluttertoast.showToast(
          msg: "Not exists Account, Registar first please",
          toastLength: Toast.LENGTH_SHORT);
    } else {
      if (json.decode(res.body) == "Wrong Password") {
        Fluttertoast.showToast(
            //gravity: ToastGravity.CENTER,
            msg: "incorrect password",
            toastLength: Toast.LENGTH_SHORT);
      } else {
        if (json.decode(res.body) == "Success") {
          //Navigator.push(
          //context, MaterialPageRoute(builder: (context) => sellerHomePage()));
        }
        //print(jsonDecode(res.body));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text("Shop Owner Login Page")),
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
              //insert a logo here, check video "5:21" "https://www.youtube.com/watch?v=zxVqSgr-_EA"
              SizedBox(height: 80.0),
              SizedBox(height: 15.0),
              Text(
                "App Name",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                height: 400,
                width: 325,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 30.0,
                    ),
                    /*Text(
                      "or we can put the name here as well",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),*/
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "Please Login to Your Account",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                        key: _formkey,
                        child: Column(
                          children: <Widget>[
                            // add the following code to make it a form
                            //delete container and replace it with form
                            //width: 250,
                            TextFormField(
                              controller: emailctrl,
                              decoration: InputDecoration(
                                labelText: "Email",
                                suffixIcon: Icon(Icons.email),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: EmailValidator(
                                  errorText: "Not A Valid Email"),
                            ),

                            //Container(
                            //width: 250,
                            TextFormField(
                              controller: passwordctrl,
                              decoration: InputDecoration(
                                labelText: "Password",
                                suffixIcon: Icon(Icons.enhanced_encryption),
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                          ],
                        )),
                    SizedBox(height: 40.0),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFF8A2387),
                                  Color(0XFFE94057),
                                  Color(0XFFF27121),
                                ])),
                        child: Padding(
                          padding: EdgeInsets.all(0.0),
                          child: FlatButton(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () => sellerLogin(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFF8A2387),
                                  Color(0XFFE94057),
                                  Color(0XFFF27121),
                                ])),
                        child: Padding(
                          padding: EdgeInsets.all(0.0),
                          child: FlatButton(
                              child: Text(
                                "Registar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                sellerRegPage()))
                                  }),
                        ),
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
