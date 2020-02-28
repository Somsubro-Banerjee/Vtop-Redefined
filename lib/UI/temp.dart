import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'Drawerlayout.dart';
class ExtendedHome extends StatelessWidget {
  final backgroundColor = Color(0xFF2c2c2c);
  final firstTabColor = Color(0xFF1d1d1d);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(8, 4),
  const StaggeredTile.count(4, 4),
  const StaggeredTile.count(4, 6),
  const StaggeredTile.count(4, 6),
  const StaggeredTile.count(4, 4),
];
 
 const String hello='Hello there';
 const String hi='Sexy';

// List<Widget> _tiles = const <Widget>[
//   const _Example01Tile( Icons.widgets, hello),
//   const _Example01Tile( Icons.wifi, hi),
//   const _Example01Tile( Icons.panorama_wide_angle, hello),
//   const _Example01Tile( Icons.map, hello),
//   const _Example01Tile( Icons.send, hello),
// ];

// class _Example01Tile extends StatelessWidget {
//   const _Example01Tile( this.iconData, this.text);

//   final String text;
//   final IconData iconData;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//       ),
      
//         // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             // image: DecorationImage(
//             //   fit: BoxFit.cover,
//             //   image: NetworkImage('https://images.pexels.com/photos/3667816/pexels-photo-3667816.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'))
//           ),
//           child: new InkWell(
//             borderRadius: BorderRadius.circular(20),
//             onTap: () {
//               debugPrint(text);
//             },
//             child: new Center(
//               child: new Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: new Icon(
//                   iconData,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ),
//     );
//   }
// }


class FirstScreen extends StatelessWidget {
  final firstTabColor = Color(0xFF1d1d1d);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: firstTabColor,
      body: new Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: new StaggeredGridView.count(
              children: <Widget>[
              Container(
                child: Text("Nice Secy"),
              ),
               Container(
                child: Text("Nice Secy"),
              ),
               Container(
                child: Text("Nice Secy"),
              ),
              
               Container(
                child: Text("Nice Secy"),
              ),
               Container(
                child: Text("Nice Secy"),
              ),
              
              ],
              crossAxisCount: 8,
              staggeredTiles: _staggeredTiles,
             
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              padding: const EdgeInsets.all(20.0),
            )
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
      body: Center(
        child: Text('Tab 2 Layout'),
      ),
    );
  }
}






