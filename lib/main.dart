import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import './page/sevices.dart';
import './page/formulaire.dart';
import 'package:device_info/device_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                /*
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
                */
                Tab(child: AutoSizeText("Services", style : TextStyle(fontSize: 10.0), maxLines: 1)),
                Tab(child: AutoSizeText("Formulaire", style : TextStyle(fontSize: 10.0), maxLines: 1)),
                Tab(child: AutoSizeText("Résultats", style : TextStyle(fontSize: 10.0), maxLines: 1)),
                Tab(child: AutoSizeText("Groupe", style : TextStyle(fontSize: 10.0), maxLines: 1)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              Services(),
              Formulaire(),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}

