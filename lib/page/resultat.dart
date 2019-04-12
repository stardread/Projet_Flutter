import 'package:flutter/material.dart';
import '../ClientModel.dart';
import '../InscriptionModel.dart';
import '../ServiceModel.dart';
import '../Database.dart';
import 'dart:math' as math;


class Resultat extends StatefulWidget {
  @override
  _Resultat createState() => _Resultat();
}

class _Resultat extends State<Resultat> {


  final nameController = new TextEditingController();
  final resController = new TextEditingController();
  String tmp = "Test ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Inscription>>(
        future: DBProvider.db.getAllInscription(),
        builder: (BuildContext context, AsyncSnapshot<List<Inscription>> snapshot) {

          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Inscription item = snapshot.data[index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  child: ListTile(

                    title: Text(item.data.toString() ?? ' Test'),
                    leading: Text(item.id.toString()),
                    /*
                    trailing: Checkbox(
                      onChanged: (bool value) {
                        DBProvider.db.blockOrUnblock(item);
                        setState(() {});
                      },
                      value: item.blocked,
                    ),
                    */
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )
    );
  }
}