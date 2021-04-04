//import 'dart:ffi';

//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sdp/Customer_Login_Page.dart';
import 'package:sdp/Seller_Login_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SDP",
      home: new LoginPage(),
      theme: new ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text("SDP Test")),
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
                    Text(
                      "or we can put the name here as well",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 125.0,
                    ),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFF8A2387),
                                  Color(0XFFE94057),
                                  Color(0XFFF27121),
                                ])),
                        child: Padding(
                          padding: EdgeInsets.all(1.0),
                          child: FlatButton(
                              child: Text(
                                "Login As A Customer",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CusPage()))
                                  }),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFF8A2387),
                                  Color(0XFFE94057),
                                  Color(0XFFF27121),
                                ])),
                        child: Padding(
                          padding: EdgeInsets.all(1.0),
                          child: FlatButton(
                              child: Text(
                                "Login As A Service Provider",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                sellerLoginPage()))
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
