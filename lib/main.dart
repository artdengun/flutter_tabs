import 'package:flutter/material.dart';
import './About.dart';
import './Profile.dart';
import './Register.dart';
import './Login.dart';
import './test.dart';

void main() => runApp(myApp());

class myApp extends StatefulWidget {
  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.pink,
          leading: Icon(Icons.close),
          title: Text("Application Tabs"),
          actions: [Icon(Icons.location_searching)],
          bottom: TabBar(controller: controller, tabs: <Tab>[
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.save),
            ),
            Tab(
              icon: Icon(Icons.exit_to_app),
            ),
            Tab(
              icon: Icon(Icons.account_box),
            ),
            Tab(
              icon: Icon(Icons.add_to_home_screen),
            ),
          ]),
        ),
        body: TabBarView(
            controller: controller,
            children: <Widget>[About(), Profile(), Register(), Login(), test()]),
      ),
    );
  }
}
