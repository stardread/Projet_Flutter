import 'package:flutter/material.dart';
import "package:system_info/system_info.dart";



void main() => runApp(new MaterialApp( home: new Info()));

class Info extends StatefulWidget {
  @override
  _InfoState createState() => new _InfoState();
}


class _InfoState extends State<Info> {

  getInfo() {
    const int MEGABYTE = 1024 * 1024;
    var processors = SysInfo.processors;

showDialog(context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Informations systeme"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Kernel architecture     : ${SysInfo.kernelArchitecture}"),
                Text("Kernel bitness          : ${SysInfo.kernelBitness}"),
                Text("Kernel name             : ${SysInfo.kernelName}"),
                Text("Kernel version          : ${SysInfo.kernelVersion}"),
                Text("Operating system name   : ${SysInfo.operatingSystemName}"),
                Text("Operating system version: ${SysInfo.operatingSystemVersion}"),
                Text("User directory          : ${SysInfo.userDirectory}"),
                Text("User id                 : ${SysInfo.userId}"),
                Text("User name               : ${SysInfo.userName}"),
                Text("User space bitness      : ${SysInfo.userSpaceBitness}"),
                Text("Number of processors    : ${processors.length}"),
                /*for (var processor in processors) {
                  Text("  Architecture          : ${processor.architecture}"),
                  Text("  Name                  : ${processor.name}"),
                  Text("  Socket                : ${processor.socket}"),
                  Text("  Vendor                : ${processor.vendor}"),
                }*/
                Text("Total physical memory   : ${SysInfo.getTotalPhysicalMemory() ~/ MEGABYTE} MB"),
                Text("Free physical memory    : ${SysInfo.getFreePhysicalMemory() ~/ MEGABYTE} MB"),
                Text("Total virtual memory    : ${SysInfo.getTotalVirtualMemory() ~/ MEGABYTE} MB"),
                Text("Free virtual memory     : ${SysInfo.getFreeVirtualMemory() ~/ MEGABYTE} MB"),
                Text("Virtual memory size     : ${SysInfo.getVirtualMemorySize() ~/ MEGABYTE} MB"),
              ],
            ),
          )  ,
        );
      },);
  }


  String device = "";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body : new Column(
        children: <Widget>[
          new RaisedButton(onPressed: getInfo, child : new Text('Valider')),
          new Text('runnin on $device'),
        ],

      ),

    );
    
  }
}
