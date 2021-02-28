import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int favColor = Colors.white.value;
  List<double> fontsizes = [20.0, 30.0, 40.0];
  double fsize = 40.0;
//1
  SharedPreferences prefs;
//2
  saveColorData(int color) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setInt('favc', color);
  }

  saveFontData(double fontSize) async {
    prefs = await SharedPreferences.getInstance();

    prefs.setDouble('fsize', fontSize);
  }

//3
  getData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      favColor = prefs.getInt('favc') ?? Colors.white.value;
      fsize = prefs.getDouble('fsize') ?? 40.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    //4
    getData();
    return Scaffold(
      backgroundColor: Color(favColor),
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Text(
                "COLORS",
                style: Theme.of(context).textTheme.headline4,
              ),
              RadioListTile(
                title: Text("Green"),
                value: Colors.green.value,
                groupValue: favColor,
                onChanged: (val) {
                  setState(() {
                    favColor = val;
                    saveColorData(val);
                  });
                },
              ),
              RadioListTile(
                title: Text("Red"),
                value: Colors.red.value,
                groupValue: favColor,
                onChanged: (val) {
                  setState(() {
                    favColor = val;
                    saveColorData(val);
                  });
                },
              ),
              RadioListTile(
                title: Text("Orange"),
                value: Colors.orange.value,
                groupValue: favColor,
                onChanged: (val) {
                  setState(() {
                    favColor = val;
                    saveColorData(val);
                  });
                },
              ),
              Text(
                "FONTS",
                style: Theme.of(context).textTheme.headline4,
              ),
              DropdownButton(
                value: fsize,
                onChanged: (val) {
                  setState(() {
                    fsize = val;
                    saveFontData(val);
                  });
                },
                items: fontsizes.map((item) {
                  return DropdownMenuItem(
                    child: Text(item.toString()),
                    value: item,
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
