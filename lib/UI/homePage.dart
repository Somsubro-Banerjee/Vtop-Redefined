import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        // centerTitle: true,
        // title: Text("V-TOP REdefined",
        // style:TextStyle(
        //   color: Colors.white
        // )
        // ),
      ),
      drawer: Drawer(
        elevation: 16,
      ),
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: MyCustomClipper(),
              child: Container(
              height:200,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                    )
                    ],
                color: Colors.blue,
              ),
              child: Container(
                margin: EdgeInsets.only(top:50, right: 80, left: 80),
                child: Text("V-TOP REDEFINED", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height-100);
    var controllPoint =Offset(50, size.height);
    var endPoint=Offset(size.width/2, size.height);
    path.quadraticBezierTo(controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
   
    return true;
  }


}