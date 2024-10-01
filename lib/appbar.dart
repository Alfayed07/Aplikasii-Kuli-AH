////////////////////////////////////////////////////////////////////////

// SESI AWAL MEMBUAT STYLE,TEXT AND ICON

// import 'package:flutter/material.dart';

// void main() {
//   runApp(new MaterialApp(
//     home: new halHallo(),
//   ));
// }

// class halHallo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: new Center(
//         child: new Container(
//           color: Colors.blue[400],
//           width: 150.0,
//           height: 100.0,
//           child: new Center(
//             //     child: new Icon(
//             //   Icons.wallet,
//             //   color: Colors.white,
//             //   size: 15.0,
//             // ),
//             child: new Text(
//               "hello world",
//               style: new TextStyle(
//                   color: Colors.white, fontFamily: "serif", fontSize: 15.0),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//////////////////////////////////////////////////////////////////////////////////////////////////

// SESI 1 MEMBUAT APPBAR

// import 'package:flutter/material.dart';

// void main() {
//   runApp(new MaterialApp(
//     title: "homePage",
//     home: new HalamanSatu(),
//   ));
// }

// class HalamanSatu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       backgroundColor: Colors.white,
//       appBar: new AppBar(
//         backgroundColor: Colors.yellow[900],
//         leading: new Icon(Icons.wallet),
//         title: new Center(child: new Text("Rp.2.000.000,00")),
//         actions: <Widget>[new Icon(Icons.circle_notifications)],
//       ),
//     );
//   }
// }

//import 'package:flutter/material.dart';

///////////////////////////////////////////////////////////////////////////////////////////

// SESI 2 MENGATUR LAYOUT ( ROW AND COLUMN)

// class HalamanSatu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       backgroundColor: Colors.white,
//       appBar: new AppBar(
//         backgroundColor: Colors.yellow[900],
//         leading: new Icon(Icons.wallet),
//         title: new Text("Rp.2.000.000,00"),
//         actions: <Widget>[new Icon(Icons.circle_notifications)],
//       ),
//       body: new Container(
//           child: new Column(
//         children: <Widget>[
//           new Icon(Icons.local_pizza, size: 50.0),
//           new Row(
//             children: <Widget>[
//               new Icon(Icons.h_mobiledata, size: 50.0),
//               new Icon(Icons.alarm_add, size: 50.0),
//               new Icon(Icons.home, size: 50.0),
//             ],
//           ),
//           new Icon(Icons.cake, size: 50.0),
//         ],
//       )),
//     );
//   }
// }

///////////////////////////////////////////////////////////////////////

// SESI 3 MEMBUAT CARD AND PARSING DATA

// import 'package:flutter/material.dart';

// void main() {
//   runApp(new MaterialApp(
//     title: "homePage",
//     home: new HalamanSatu(),
//   ));
// }

// class HalamanSatu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.yellow[900],
//         leading: Icon(Icons.wallet),
//         title: Text("Rp.2.000.000,00"),
//         actions: <Widget>[Icon(Icons.circle_notifications)],
//       ),
//       body: Container(
//         padding: EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             CardSaya(
//               icon: Icons.home,
//               teks: "home",
//               warnaicon: Colors.brown,
//             ),
//             CardSaya(
//               icon: Icons.favorite,
//               teks: "favorite",
//               warnaicon: Colors.pink,
//             ),
//             CardSaya(
//               icon: Icons.place,
//               teks: "place",
//               warnaicon: Colors.blue,
//             ),
//             CardSaya(
//               icon: Icons.settings,
//               teks: "setting",
//               warnaicon: Colors.black,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CardSaya extends StatelessWidget {
//   CardSaya({required this.icon, required this.teks, required this.warnaicon});

//   final IconData icon;
//   final String teks;
//   final Color warnaicon;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(10.0),
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: <Widget>[
//               Icon(
//                 icon,
//                 size: 50.0,
//                 color: warnaicon,
//               ),
//               SizedBox(height: 10.0),
//               Text(
//                 teks,
//                 style: TextStyle(fontSize: 20.0),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

/////////////////////////////////////////////////////////////////////////
// SESI 4 NAVIGATION ROUTES (BERPINDAH HALAMAN)
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     home: HalamanSatu(),
//     title: "Navigasi",
//     routes: <String, WidgetBuilder>{
//       '/halsatu': (BuildContext context) => HalamanSatu(),
//       '/haldua': (BuildContext context) => HalamanDua(),
//     },
//   ));
// }

// class HalamanSatu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("music"),
//       ),
//       body: Center(
//         child: IconButton(
//           icon: Icon(Icons.headset, size: 50.0),
//           onPressed: () {
//             Navigator.pushNamed(context, '/haldua');
//           },
//         ),
//       ),
//     );
//   }
// }

// class HalamanDua extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("speaker"),
//       ),
//       body: Center(
//         child: IconButton(
//           icon: Icon(Icons.speaker, size: 50.0),
//           onPressed: () {
//             Navigator.pushNamed(context, '/halsatu');
//           },
//         ),
//       ),
//     );
//   }
// }