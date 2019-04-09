import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import '../ServiceModel.dart';
import '../Database.dart';
import 'dart:math' as math;
//import 'package:json_to_form/json_to_form.dart'; 
import '../romain/json_to_form_romain.dart';

import 'package:http/http.dart' as http;


class Formulaire extends StatefulWidget {
  @override
  _Formulaire createState() => _Formulaire();
}

class _Formulaire extends State<Formulaire> {
  String url = 'https://raw.githubusercontent.com/stardread/Projet_Flutter/kevin/assets/service.json';
  String data;
  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var extractdata = json.decode(response.body);
      //for pour rajouter value dans radiobox
      data = json.encode(extractdata['services'][0]['elements']);

    });
  }
  @override
  void initState() {
    this.makeRequest();
  }

  var sendersList = ['test1', 'test2', 'test3'];
  var subjectList = ['description1', 'description2', 'description3'];
  final nameController = new TextEditingController();
  dynamic response;
  @override
   Widget build(BuildContext context) {
     return new Scaffold(
       appBar: new AppBar(
         title: new Text('Formulaire'),
       ),
       body: new SingleChildScrollView(
         child: new Container(
           child: new Column(children: <Widget>[
             new CoreForm(
               
               form: data,
               onChanged: (dynamic response) {
                 this.response = response;
               },
             ),
             new RaisedButton(
                 child: new Text('Send'),
                 onPressed: () {
                   print(this.response.toString());
                 })
           ]),
         ),
       ),
     );
   }
}