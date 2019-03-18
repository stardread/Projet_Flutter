import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import './page/sevices.dart';
import './page/formulaire.dart';
import 'package:device_info/device_info.dart';
import './page/services2.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
      title: "Services App",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  var url =
      "assets/services.json";

  Services2 services;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decodedJson = jsonDecode(url);
    services = services.fromJson(decodedJson);
    print(services.toJson());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Services App"),
        backgroundColor: Colors.cyan,
      ),
      body: services == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              crossAxisCount: 2,
              children: services.services
                  .map((service) => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          /*onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => serviceDetail(
                                          servicemon: service,
                                        )));
                          },*/
                          child: Hero(
                            tag: service.title,
                            child: Card(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    height: 100.0,
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(service.elements.elementAt(0).toString()))),
                                  ),
                                  Text(
                                    service.title,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.cyan,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
/*
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [*/
                /*
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
                *//*
                Tab(child: AutoSizeText("Services", style : TextStyle(fontSize: 10.0), maxLines: 1)),
                Tab(child: AutoSizeText("Formulaire", style : TextStyle(fontSize: 10.0), maxLines: 1)),
                Tab(child: AutoSizeText("Résultats", style : TextStyle(fontSize: 10.0), maxLines: 1)),
                Tab(child: AutoSizeText("Groupe", style : TextStyle(fontSize: 10.0), maxLines: 1)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              Services(),
              Formulaire(),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}

*/