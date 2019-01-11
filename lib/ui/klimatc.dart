import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../util/util.dart' as util;

class Klimatic extends StatefulWidget  {
  @override
  State<StatefulWidget> createState() {

    return KlimaticState ();
  }

}

class KlimaticState extends State<Klimatic> {

  void showStuff() async{
    Map data = await getWeather (util.appId, util.defaultCity);
    
  }

  @override
  Widget build(BuildContext context) {

  return new Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      appBar: new AppBar(title: Text("Weather App"),backgroundColor: Colors.amberAccent,
        actions: <Widget>[
          new IconButton( icon:new Icon( Icons.menu), onPressed: ()=>debugPrint("OK"))
        ],),


      body:new Stack(children: <Widget>[
        new Center(
          child: new Image.asset('images/gary.jpg',width: 490.0,height: 1200.0,fit: BoxFit.fill,),
        ),

        new Container(
          alignment: Alignment.topRight,margin: const EdgeInsets.fromLTRB(0.0,11.0,21.0,0.0),
          child: new Text("Spokane",style: cityStyle(),),
        ),

        new Container(
          alignment: Alignment.center,
          child: new Image.asset('images/cloud.png'),
        ),

        new Container(
          margin: const EdgeInsets.fromLTRB(30.0,290.0,0.0,0.0),
          child:  updateTempWeather("Beira"),
        ),
      ],)
      );

  }

  Future<Map> getWeather(String appId,String city) async {

    String appUrl='https://samples.openweathermap.org/data/2.5/weather?q=$city&appid=${util.appId}';
//https://samples.openweathermap.org/data/2.5/weather?q=Jeddah&appid=b6907d289e10d714a6e88b30761fae22
    http.Response response =  await http.get(appUrl);

    return json.decode(response.body);

}

  Widget updateTempWeather(String city ){
    return new FutureBuilder(
        future: getWeather(util.appId, city),
        builder: (BuildContext context,AsyncSnapshot<Map> snapshot){
          if(snapshot.hasData){
            Map content = snapshot.data;
            return new Container(
              child: new Column(
                children: <Widget>[
                  new ListTile(title: new Text(content['main']['temp'].toString(),
                    style: new TextStyle(fontSize: 49.1,fontStyle: FontStyle.normal,fontWeight: FontWeight.w600),),)
                ],
              ),
            );
          }else return new Container();
        },
    );
  }
}


TextStyle cityStyle(){
  return new TextStyle(
    color: Colors.black,fontSize: 28.9,fontStyle: FontStyle.italic
  );
}