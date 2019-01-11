import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import './ui/klimatc.dart';
import './ui/home.dart';
import './ui/login.dart';
import './ui/planet.dart';
import './ui/bmi.dart';
import './ui/quakes.dart';

Map _data;
List _features;

void main() async {
  _data = await getQuakes();
  _features = _data['features'];
  runApp(new MaterialApp(
    title: "Klimatic",
    home: new Klimatic(),
  )
  );
}

class Quakes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      backgroundColor: Colors.limeAccent.shade700,

      appBar: new AppBar(title: Text("Quakes App"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,),
      body: new Center(
        child: new ListView.builder(
          itemCount: _features.length,
          padding: const EdgeInsets.all(5.0),
          itemBuilder: (BuildContext context, int position) {
            if (position.isOdd) return new Divider();
            final index = position ~/ 2;
            return new ListTile(

              title: Text("Mag: ${_features[position]['properties']['mag']}",
                style: TextStyle(fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.red),),

              subtitle: Text(_features[index]['properties']['place'],
                style: TextStyle(fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.orange,
                    fontStyle: FontStyle.italic),),

              leading: new CircleAvatar(backgroundColor: Colors.greenAccent,
                child: new Text("${_features[index]['properties']['mag']}",
                  style: new TextStyle(
                      fontSize: 16.5, color: Colors.indigo),),),
            );
          },
        ),
      ),
    );
  }
}
Future<Map>  getQuakes() async {
  String apiUrl = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson";
  http.Response response = await http.get(apiUrl);

  return json.decode(response.body) ;
}