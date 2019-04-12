import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import './page/sevices.dart';
import './page/formulaire.dart';
import './page/groupe.dart';
import './page/infos.dart';
import './page/resultat.dart';



void main() => runApp(MyHomePage());

class MyHomePage extends StatelessWidget {



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
                Tab(child: AutoSizeText("Infos", style : TextStyle(fontSize: 10.0), maxLines: 1)),
                Tab(child: AutoSizeText("Groupe", style : TextStyle(fontSize: 10.0), maxLines: 1)),
              ],
            ),
            title: Text('Tabs Demo'),
            

          ),
          
          body: TabBarView(
            children: [
              Services(),
              Formulaire(),
              Resultat(),
              Info(),
              Groupe(),
            ],
          ),
        ),
      ),
    );
  }
}

