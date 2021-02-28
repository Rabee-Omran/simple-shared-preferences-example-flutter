import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './settings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int favColor = Colors.white.value;
  double fsize = 40.0;

  SharedPreferences prefs;
  getData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      favColor = prefs.getInt('favc') ?? Colors.white.value;
      fsize = prefs.getDouble('fsize') ?? 40.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      backgroundColor: Color(favColor),
      appBar: AppBar(
        title: Text(
          'Shared Preferences',
          style: TextStyle(fontSize: fsize),
        ),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => Settings())),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: null,
      ),
    );
  }
}
