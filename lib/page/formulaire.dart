import 'package:flutter/material.dart';
import '../ServiceModel.dart';
import '../Database.dart';
import 'dart:math' as math;


class Formulaire extends StatefulWidget {
  @override
  _Formulaire createState() => _Formulaire();
}

class _Formulaire extends State<Formulaire> {
  var sendersList = ['test1', 'test2', 'test3'];
  var subjectList = ['description1', 'description2', 'description3'];
  final nameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[

            new TextFormField(
              controller: nameController,
            ),
            new TextFormField(
                controller: nameController,
            ),
            new RaisedButton(
              onPressed: () async{

                Service rnd = new Service(id: 5, name: nameController.text);
                await DBProvider.db.newService(rnd);
                setState(() {});
              },
            ),
            new RaisedButton(
              child: Column(
                children: <Widget>[
                  new Text("Destroy")
                ],
              ),
              onPressed: () async{

                await DBProvider.db.destroy();
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}