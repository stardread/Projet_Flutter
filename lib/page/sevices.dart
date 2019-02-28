import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  var serviceTitle = ['Netflix', 'Spotify', 'Runastic'];
  var serviceDescription = ['Vos séries en illimité', 'Retrouvez vos musiques partout avec vous', 'Votre partenaire de jogging'];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child:
        ListView.builder(
          itemBuilder: (context, position) {
            return Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    onTap:() { },
                    leading: Icon(Icons.album), 
                    title: Text(serviceTitle[position]),
                    subtitle: Text(serviceDescription[position]),
                  ),
                ],
              ),
            );
          },
          itemCount: serviceTitle.length,
        ),
      )
    );
  }
}