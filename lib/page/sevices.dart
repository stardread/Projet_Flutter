import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import './formulaire.dart';
import '../ServiceModel.dart';
import '../Database.dart';


class Services extends StatefulWidget {
  @override
  _Services createState() => _Services();
}

class _Services extends State<Services> {

  String url = 'https://raw.githubusercontent.com/stardread/Projet_Flutter/kevin/assets/service.json';
  List data;
  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata["services"];

    });
/*
    var itemCount =  (data == null) ? 0 : data.length;
    for (var i ; i< itemCount; i++) {
      DBProvider.db.newService(new Service(id : 1, title : data[i]["title"]));
      setState(() {});
    }
*/
    //Client rnd = testClients[math.Random().nextInt(testClients.length)];
    //await DBProvider.db.newClient(rnd);

  }

  @override
  void initState() {
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        body: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, i) {
              DBProvider.db.newService(new Service(id : 1, title : data[i]["title"]));
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

                          new Formulaire()
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