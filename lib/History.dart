import 'package:flutter/material.dart';

void main() {
  runApp(HalamanHistory());
}

class HalamanHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.yellow[900],
        leading: new Icon(Icons.wallet),
        title: new Center(child: new Text("Rp.2.000.000,00")),
        actions: <Widget>[new Icon(Icons.circle_notifications)],
      ),
    );
  }
}
