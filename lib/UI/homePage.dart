import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'Drawerlayout.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final backgroundColor = Color(0xFF4A4A58);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
        // ),
        backgroundColor: Colors.pink,
        elevation: 0.0,
        title: Text("V-TOP REMASTERED", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      drawer: Drawer(
        elevation: 16.0,
        child: DrawerLayout(),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              ClipPath(
                clipper: MyCustomClipper(),
                  child: Container(
                  height:250,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                        )
                        ],
                    color: Colors.pink,
                  ),
                  child: Center(
                    child: Container(
                      // margin: EdgeInsets.only(top:10, right: 80, left: 100),
                      // child: Text("V-TOP REDEFINED...", style: TextStyle(color: Colors.white, fontSize: 25, fontFamily: 'Weather'),),
                    ),
                  ),
                ),
              )
            ],
          ),

          Container(
            // padding: EdgeInsets.all(5),
            height: 150,
            width: 2000,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 150,
                  width: 150,
                  child: Card(
                    child: Center(child: Text("Nice Sexy")),
                  ),
                ),
                 Container(
                   height: 150,
                   width: 150,
                   child: Card(
                    child: Center(child: Text("Nice Sexy")),
                ),
                 ),
              ],
            )),
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
    var controllPoint =Offset(0, size.height);
    var endPoint=Offset(size.width/3, size.height);
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