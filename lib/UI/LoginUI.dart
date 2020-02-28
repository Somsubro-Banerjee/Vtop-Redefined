import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'dart:ui';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/bird.jpg'),
                // repeat: ImageRepeat.repeat,
                colorFilter: ColorFilter.mode(Colors.blueGrey, BlendMode.colorBurn),  
              ),
            ),
            child: BackdropFilter(
              filter:ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: new Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.0),
                ),
                child: Stack(),
              ),
              ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(                
                // color: Colors.white,
                height: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[

                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text("LOGIN", style:TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'ProductB',
                          fontWeight: FontWeight.w900,
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
