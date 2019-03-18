import 'package:flutter/material.dart';



void main() => runApp(new MaterialApp( home: new Info()));

class Info extends StatefulWidget {
  @override
  _InfoState createState() => new _InfoState();
}


class _InfoState extends State<Info> {

  getInfo() {


  }


  String device = "";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body : new Column(
        children: <Widget>[
          new RaisedButton(onPressed: getInfo, child : new Text('Valider')),
          new Text('runnin on $device'),
        ],

      ),

    );
    
  }
}
