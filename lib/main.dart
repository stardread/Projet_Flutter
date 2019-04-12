import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import './page/sevices.dart';
import './page/formulaire.dart';
import './page/groupe.dart';
import './page/infos.dart';
import './page/resultat.dart';



void main() => runApp(MyHomePage());

class MyHomePage extends StatelessWidget {

  //TabController _tabController = new TabController(length: 4, vsync: null);

  /*
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  */
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: DefaultTabController(
        length: 4,
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
            title: Text('Tabs Demo'),
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
  }
}

