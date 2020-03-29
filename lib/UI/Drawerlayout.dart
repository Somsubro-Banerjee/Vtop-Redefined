import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:vtop/Authentication/Login.dart';

class DrawerLayout extends StatelessWidget {
  final backgroundColor = Color(0xFF4A4A58);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
        ],
      ),
    );
  }
}
Widget menu(context){
  final backgroundColor = Color(0xFF4A4A58);
  return Padding(
    padding: const EdgeInsets.only(left: 16.0),
    child: Align(
      alignment:Alignment.centerLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
            margin: EdgeInsets.only(right:20, top: 0),
            child: CircleAvatar(
              
            backgroundImage: NetworkImage("https://images.pexels.com/photos/1681010/pexels-photo-1681010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
            maxRadius: 80,
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 25, top: 10),
            child: Text("D.M. Amritesh", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:20),)),
          Container(
            padding: EdgeInsets.only(right:30 ),
            child: Text("B-Tech CSE", style:TextStyle(color: Colors.white, fontSize: 15)),
          ),

            ],
          ),
          
          SizedBox(height :100),
          Container(
            // decoration: BoxDecoration()
            child: RaisedButton(
              color: backgroundColor,
              elevation: 0,
              child: Row(
                children: <Widget>[
                  SizedBox(width: 49,),
                  Icon(Icons.info_outline, color: Colors.white,),
                  SizedBox(width: 10,),
                  Text("Account Info", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
            ),
                ],
              ),
            onPressed: () => {},
            ),
          ),
          SizedBox(height: 30,),
           Container(
             child: RaisedButton(
               color: backgroundColor,
               elevation: 0,
               child: Row(
                 children: <Widget>[
                   SizedBox(width:1),
                   Icon(Icons.announcement, color: Colors.white,),
                   SizedBox(width: 10,),
                   Text("Announcements", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
                 ],
               ),
          onPressed: () => {},
          ),
           ),
          SizedBox(height: 30,),
           RaisedButton(
             color: backgroundColor,
             elevation: 0,
             child: Row(
               children: <Widget>[
                 SizedBox(width:110),
                 Icon(Icons.settings, color: Colors.white,),
                 SizedBox(width:8),                 Text("Settings", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
               ],
             ),
          onPressed: () => {},
          ),
          SizedBox(height: 50,),
           RaisedButton(
             color: backgroundColor,
             elevation: 0,
             child: Row(
               children: <Widget>[
                 SizedBox(width:165),
                 Icon(Icons.keyboard_arrow_left, color: Colors.white,),
                 Text("Logout", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
               ],
             ),
          onPressed: () {
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          ),
          SizedBox(height: 30,),
        ],
      ),
    ),
  );
}