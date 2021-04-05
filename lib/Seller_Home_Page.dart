//import 'dart:html';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:sdp/Seller_Services_Regestration.dart';
import 'package:validation_extensions/validation_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SellerHomePage extends StatefulWidget {
  @override
  _SellerHomePageState createState() => _SellerHomePageState();
}

class _SellerHomePageState extends State<SellerHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MultiLevelDrawer(
          header: Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Text(
                "Can add almost anything here, picture of the user, Name...etc."),
          ),

          //we can add user photo here or any random thing...
          //height: size.height * 0.25,

          children: [
            MLMenuItem(
                //BTW, we can add sub menu in it.
                leading: Icon(Icons.home),
                content: Text("Home"),
                onClick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SellerHomePage()));
                }),
            MLMenuItem(
                //BTW, we can add sub menu in it.
                leading: Icon(Icons.event_available),
                content: Text("Appointments"),
                onClick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SellerHomePage())); // another page to display the appointments that the user made for this shop.
                }),
            MLMenuItem(
                //BTW, we can add sub menu in it.
                leading: Icon(Icons.person),
                content: Text("Profile"),
                onClick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SellerHomePage())); //another page to display the seller's info.
                }),
            MLMenuItem(
                //BTW, we can add sub menu in it.
                leading: Icon(Icons.power_settings_new),
                content: Text("Log out"),
                onClick: () {
                  //Navigator.pop(context,
                  //MaterialPageRoute(builder: (context) => HomePage())); // a method to log out the seller.. wont be  a page
                }),
          ]),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(700.0, 20.0, 0.0, 20.0)),
          RaisedButton(
              child: Text("Check Appointments"),
              color: Colors.teal,
              textColor: Colors.white,
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SellerHomePage())) // another page that displays the appointments all user did in this shop, can be displayed as a calendar integration
                  }),
          Padding(padding: EdgeInsets.fromLTRB(700.0, 20.0, 0.0, 20.0)),
          RaisedButton(
              child: Text("Add Services"),
              color: Colors.teal,
              textColor: Colors.white,
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ServicesRegestration())) // This page will allow the seller to add his services and price them. so it will be displayed for the user later on.
                  }),
          Padding(padding: EdgeInsets.fromLTRB(700.0, 20.0, 0.0, 20.0)),
          RaisedButton(
              child: Text("Profile"),
              color: Colors.teal,
              textColor: Colors.white,
              onPressed: () =>
                  {}), // the same page where the user can see his info.
        ],
      ),
    );
  }
}
