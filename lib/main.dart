import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import "package:system_info/system_info.dart";

import './page/sevices.dart';
import './page/formulaire.dart';
import './page/groupe.dart';
import './page/infos.dart';
import './page/resultat.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  with SingleTickerProviderStateMixin{
  TabController _tabController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              controller: _tabController,
              isScrollable: true,
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
                Tab(child: AutoSizeText("Infos", style : TextStyle(fontSize: 10.0), maxLines: 1)),
              ],
            ),
            title: Text('Flutter'),
            /*
            actions: <Widget>[

              new IconButton(icon: Icon(Icons.info), onPressed: () {
                },)
            ]
            */




          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              Services(),
              Formulaire(index),
              Resultat(),
              Groupe(),
              Info(),
            ],
          ),
        ),
      ),
    );


  }
/*
return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              //controller: _tabController,
              isScrollable: true,
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
            title: Text('Flutter'),
            actions: <Widget>[
              new IconButton(icon: Icon(Icons.info), onPressed: () {
                //_tabController.previousIndex;
                new Info();
                print("OK");
              })

            ],

          ),
          body: TabBarView(
            children: [
              Services(),
              Formulaire(0),
              Resultat(),
              Groupe(),
            ],
          ),
        ),
      ),
    );

 */

}



