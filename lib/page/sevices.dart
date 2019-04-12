import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:http/http.dart' as http;
import './formulaire.dart';
import '../main.dart';
import '../ServiceModel.dart';
import '../Database.dart';


class Services extends StatefulWidget {
  @override
  _Services createState() => _Services();
}

class _Services extends State<Services> {


  List data;
/*
  String url = 'https://raw.githubusercontent.com/stardread/Projet_Flutter/kevin/assets/service.json';

  makeRequest() async {

    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata["services"];
    });

  }
*/

  loadAsset() async {
    //return await rootBundle.loadString('assets/service.json');
    String dataTMP = await DefaultAssetBundle.of(context).loadString("assets/service.json");

    setState(() {
      var extractdata = json.decode(dataTMP);
      data = extractdata["services"];
    });

  }


  @override
  void initState() {
    //this.makeRequest();
    this.loadAsset();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        body: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, i) {
              DBProvider.db.newService(new Service(id : 1, title : data[i]["title"]));
              print("Load Asset exmple !!! : " );
              print(data);

              return new ListTile(
                title: new Text(data[i]["title"]),
                leading: new CircleAvatar(
                  backgroundImage:
                  new NetworkImage(data[i]["elements"][0]["value"][0]),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                          //new SecondPage(data[i])
                          new Formulaire(i)
                      ));
                },


              );
            }
        )
    );
  }
/*
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.album),
                title: Text('The Enchanted Nightingale'),
                subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
              ButtonTheme.bar( // make buttons use the appropriate styles for cards
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('BUY TICKETS'),
                      onPressed: () { /* ... */ },
                    ),
                    FlatButton(
                      child: const Text('LISTEN'),
                      onPressed: () { /* ... */ },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
  */
}