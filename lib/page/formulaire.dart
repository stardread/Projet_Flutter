import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import '../ServiceModel.dart';
import '../Database.dart';
import 'dart:math' as math;
//import 'package:json_to_form/json_to_form.dart';
import '../romain/json_to_form_romain.dart';
import '../Database.dart';
import '../InscriptionModel.dart';

import './resultat.dart';
import 'package:http/http.dart' as http;


class Formulaire extends StatefulWidget {
  int index = 0;


  Formulaire(int index) {
    this.index = index;
  }
  @override
  _Formulaire createState() => _Formulaire(index);
}

class _Formulaire extends State<Formulaire> {
  String url = 'https://raw.githubusercontent.com/stardread/Projet_Flutter/kevin/assets/service.json';
  String data;
  int index;
  String nameOfService = "";

  _Formulaire(int index){
    this.index = index;
  }


   makeRequest() async {

    //return await rootBundle.loadString('assets/service.json');
    String dataTMP = await DefaultAssetBundle.of(context).loadString("assets/service.json");

    setState(() {
      var extractdata = json.decode(dataTMP);
      data = json.encode(extractdata['services'][index]['elements']);
      nameOfService = json.encode(extractdata['services'][index]['title']);
    });
  }
  @override
  void initState() {
    this.makeRequest();
  }

  final nameController = new TextEditingController();
  dynamic response;


  setResponse(dynamic response) {

    String res = "";
    for (int i = 1; i<response.length; i++) {
      res += response[i]["value"].toString()+ " : ";
      res+= response[i]["response"].toString()+ " ; ";
    }
    print("RES : "+ res);
    DBProvider.db.newInscription(new Inscription(id : 1, data : res, idService : 0));
  }


  @override
  Widget build(BuildContext context) {
    if(data != null) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text(nameOfService),
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
                    //this.response
                    setResponse(response);
                    new Resultat();
                    //print("response !!!!!!!!!!!!!!!!!!!! " + response.toString());
                    //print(this.response.toString());
                  })
            ]),
          ),
        ),
      );
    }
    else{
      return Center(child: CircularProgressIndicator());

    }

  }
}