import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'Drawerlayout.dart';

class ExtendedHome extends StatelessWidget {
  final backgroundColor = Color(0xFF2c2c2c);
  final firstTabColor = Color(0xFF1d1d1d);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer:  Drawer(
            elevation: 16.0,
            child: Scaffold(
              appBar: AppBar(
                elevation:0,
                backgroundColor: firstTabColor,
              ),
              body: DrawerLayout()),
          ),
          appBar: AppBar(
            
            actions: <Widget>[
              
            ],
            backgroundColor: backgroundColor,
            bottom: TabBar(
              tabs: [
                Tab(child: Container(child:Text("ACTIVITY", style: TextStyle(letterSpacing: 4.0),)),),
                Tab(child: Container(child:Text("DISCOVER", style: TextStyle(letterSpacing: 4.0),)),),
              ],
            ),
            centerTitle: true,
            title: Text('EXTENDED',style: TextStyle(letterSpacing:8),),
          ),
          body: TabBarView(
            children: [
              FirstScreen(),
              SecondScreen(),
            ],
          ),

        ),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  final seconfTabColor = Color(0xFF1d1d1d);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: seconfTabColor,
      body: Center(
        child: Text('Tab 2 Layout'),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final seconfTabColor = Color(0xFF1d1d1d);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: seconfTabColor,
      body: Center(
        child: Text('Tab 2 Layout'),
      ),
    );
  }
}