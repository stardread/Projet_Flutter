import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:http/http.dart' as http;
import 'package:projet/page/infos.dart';
import './formulaire.dart';
import '../ServiceModel.dart';
import '../Database.dart';


class Groupe extends StatefulWidget {
  @override
  _Groupe createState() => _Groupe();
}



class _Groupe extends State<Groupe> {
  @override
  Widget build(BuildContext context) {
    final title = 'Horizontal List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 160.0,
                color: Colors.red,
              ),
              Container(
                width: 160.0,
                color: Colors.blue,
              ),
              Container(
                width: 160.0,
                color: Colors.green,
              ),
              Container(
                width: 160.0,
                color: Colors.yellow,
              ),
              Container(
                width: 160.0,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
class _Groupe extends State<Groupe> {

  List<Slide> slides = new List();
  List data;
  loadAsset() async {
    //return await rootBundle.loadString('assets/service.json');
    String dataTMP = await DefaultAssetBundle.of(context).loadString("assets/groupe.json");

    setState(() {
      var extractdata = json.decode(dataTMP);
      data = extractdata["membres"];
    });

  }


  @override
  void initState() {
    //this.makeRequest();
    this.loadAsset();
    /*
    var itemCount = data.length;
    for (int i = 0; i<4; i++) {
      slides.add(
        new Slide(
          title : data[i]["nom"],
          description: "Allow miles wound place the leave had. To sitting subject no improve studied limited",
          pathImage: "images/photo_eraser.png",
          backgroundColor: Color(0xfff5a623),

        )
      );

    }
    */

  }

  void addintoSlide() {
    for (int i = 0; i<4; i++) {
      slides.add(
          new Slide(
            title : data[i]["nom"],
            description: data[i]["description"],
            pathImage: data[i]["photo"],
            backgroundColor: Color(int.parse(data[i]["couleur"])),

          )
      );
    }
  }

  void onDonePress() {
    // TODO: go to next screen
    new Info();
    print("estedfg");
  }

  void onSkipPress() {
    // TODO: go to next scree
  }

  @override
  Widget build(BuildContext context) {
    this.addintoSlide();
    return new IntroSlider(

      slides: this.slides,

    );
  }
}
*/