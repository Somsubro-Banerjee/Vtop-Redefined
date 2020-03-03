import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'Drawerlayout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
                backgroundColor: backgroundColor,
              ),
              body: DrawerLayout()
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

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(8, 4),
  const StaggeredTile.count(4, 4),
  const StaggeredTile.count(4, 6),
  const StaggeredTile.count(4, 6),
  const StaggeredTile.count(4, 4),
];

class FirstScreen extends StatelessWidget {
  final firstTabColor = Color(0xFF1d1d1d);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: firstTabColor,
      body: Padding(
        padding: EdgeInsets.only(top: 12.0),
        child: StaggeredGridView.count(
          crossAxisCount: 8,
          staggeredTiles: _staggeredTiles,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          padding: EdgeInsets.all(20.0),
          children: <Widget>[
            Container(
              child: Ink(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey.shade700,
                    style: BorderStyle.solid
                  ),
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage('https://images.pexels.com/photos/3792581/pexels-photo-3792581.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
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
                          Padding(padding: EdgeInsets.only(top: 120, left: 15),
                            child: Text("Event 1",
                              textAlign: TextAlign.left,
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
            Container(
              child: Ink(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey.shade700,
                    style: BorderStyle.solid
                  ),
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage('https://images.pexels.com/photos/3667816/pexels-photo-3667816.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
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
                          Padding(padding: EdgeInsets.only(top: 120, left: 15),
                            child: Text("Event 2",
                              textAlign: TextAlign.left,
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
            Container(
              child: Ink(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey.shade700,
                    style: BorderStyle.solid
                  ),
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage('https://images.pexels.com/photos/3617496/pexels-photo-3617496.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
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
                          Padding(padding: EdgeInsets.only(top: 210, left: 15),
                            child: Text("Event 3",
                              textAlign: TextAlign.left,
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
            Container(
              child: Ink(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey.shade700,
                    style: BorderStyle.solid
                  ),
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage('https://images.pexels.com/photos/3736816/pexels-photo-3736816.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
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
                          Padding(padding: EdgeInsets.only(top: 210, left: 15),
                            child: Text("Event 4",
                              textAlign: TextAlign.left,
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
            Container(
              child: Ink(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey.shade700,
                    style: BorderStyle.solid
                  ),
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage('https://images.pexels.com/photos/2792157/pexels-photo-2792157.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
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
                          Padding(padding: EdgeInsets.only(top: 120, left: 15),
                            child: Text("Event 5",
                              textAlign: TextAlign.left,
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
          ],
        ),
      )
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
            return CircularProgressIndicator();
          }
          else{
            return ListView.builder(
              
              padding: EdgeInsets.all(20),
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index){
                DocumentSnapshot docsSnap = snapshot.data.documents[index];
                return  Container(
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
                          Padding(padding: EdgeInsets.only(top: 120, left: 15),
                            child: Text('${docsSnap['text']}',
                              textAlign: TextAlign.left,
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
            );
                
              },
            );
          }
        },
      ),
    );
  }
}



