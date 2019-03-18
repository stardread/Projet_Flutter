import 'package:flutter/material.dart';
import '../ClientModel.dart';
import '../ServiceModel.dart';
import '../Database.dart';
import 'dart:math' as math;


class Resultat extends StatefulWidget {
  @override
  _Resultat createState() => _Resultat();
}

class _Resultat extends State<Resultat> {


  List<Client> testClients = [
    Client(firstName: "Raouf", lastName: "Rahiche", blocked: false),
    Client(firstName: "Zaki", lastName: "oun", blocked: true),
    Client(firstName: "oussama", lastName: "ali", blocked: false),
  ];
  var sendersList = ['test1', 'test2', 'test3'];
  var subjectList = ['description1', 'description2', 'description3'];
  final nameController = new TextEditingController();
  final resController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Service>>(
        future: DBProvider.db.getAllService(),
        builder: (BuildContext context, AsyncSnapshot<List<Service>> snapshot) {

          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Service item = snapshot.data[index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    DBProvider.db.deleteClient(item.id);
                  },
                  child: ListTile(
                    title: Text(item.name),
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
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Service stmp = new Service(id : 1, name : 'Netflix');
          await DBProvider.db.newService(stmp);
          //Client rnd = testClients[math.Random().nextInt(testClients.length)];
          //await DBProvider.db.newClient(rnd);
          setState(() {});
        },
      ),
    );
  }
}