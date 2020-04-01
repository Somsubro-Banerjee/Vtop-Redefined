import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:random_color/random_color.dart';
class ExtendedHome extends StatelessWidget {
  final backgroundColor = Color(0xFF2c2c2c);
  final firstTabColor = Color(0xFF1d1d1d);
  @override
  Widget build(BuildContext context) {
    RandomColor _randomColor = RandomColor();
    Color colour = _randomColor.randomColor(colorBrightness: ColorBrightness.light);
    
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    initUser() async{
      FirebaseUser user;
      user = await _auth.currentUser();
      String email = user.email;
      return user;
    }

   Future<String> getPhoto(GoogleSignInAccount account, String userId) async{
     final url = 'http://people.googleapis.com/v1/people/$userId?personFields=photos';
     final response = await http.get(
       url,
      headers: await account.authHeaders,
     );
     final data = json.decode(response.body);
     return data['photos'].first['url'];
   }


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer:  Drawer(
            child:  ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountEmail: Text('${user?.email}'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage("https://images.pexels.com/photos/4035323/pexels-photo-4035323.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260") ,
                    backgroundColor: colour,
                    radius: 20,
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            actions: <Widget>[],
            backgroundColor: backgroundColor,
            bottom: TabBar(indicatorColor: Colors.purpleAccent,labelColor: Colors.purpleAccent.shade100,unselectedLabelColor: Colors.white,
              tabs: [
                Tab(child: Container(child:Text("ACTIVITIES", style: TextStyle(letterSpacing: 1.5, fontSize: 16),)),),
                Tab(child: Container(child:Text("DISCOVER", style: TextStyle(letterSpacing: 1.5, fontSize: 16),)),),
              ],
            ),
            centerTitle: true,
            title: Text('EXTENDED',style: TextStyle(fontSize: 22,letterSpacing:7),)
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
      body: Stack(
        children: <Widget>[
          // Do changes here
        ],
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
      body: StreamBuilder(
        stream: Firestore.instance.collection('posts').snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }
          else{
            return ListView.builder(
              
              padding: EdgeInsets.all(20),
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index){
                DocumentSnapshot docsSnap = snapshot.data.documents[index];
                return  AnimatedContainer(
                  curve: Curves.fastOutSlowIn,
                  duration:Duration(seconds:2) ,
                  // width:  ? 200.0 : 100,
                    child: Container(
                    padding: EdgeInsets.all(10),
              child: Ink(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey.shade700,
                      style: BorderStyle.solid
                    ),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage('${docsSnap['image']}'),
                      fit: BoxFit.cover
                    )
                  ),
                  child: ClipRRect(borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2.5,sigmaY: 2.5),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(22),
                        onTap: (){},
                        child: Stack(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(bottom: 40, top: 150, left: 20),
                              child: Text('${docsSnap['text']}',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                              ),
                            )
                          ]
                        )
                      ),
                    )
                  )
              ),
            ),
                ); 
              },
            );
          }
        },
      ),
    );
  }
}



