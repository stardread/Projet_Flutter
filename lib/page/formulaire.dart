import 'package:flutter/material.dart';


class Formulaire extends StatelessWidget {
  var sendersList = ['test1', 'test2', 'test3'];
  var subjectList = ['description1', 'description2', 'description3'];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child:
        ListView.builder(
          itemBuilder: (context, position) {
            return Card(
              child: Text(sendersList[position]),
            );
          },
          itemCount: sendersList.length,
        )
      ),
    );
  }
}