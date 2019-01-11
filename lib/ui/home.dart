import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.amberAccent.shade200,
          title: new Text("Title 1"),
          actions: <Widget>[
            new IconButton(icon: Icon(Icons.add_circle), onPressed: ()=> debugPrint("Press1")),
            new IconButton(icon: Icon(Icons.add_circle_outline), onPressed: ()=> debugPrint("Press2")),
            new IconButton(icon: Icon(Icons.add_comment), onPressed: ()=> debugPrint("Press3")),
          ],
        ),
      backgroundColor:Colors.white30,

      body:new Container(
        alignment: Alignment.center,

            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("Text 1",style: new TextStyle(fontSize: 40.0,fontWeight: FontWeight.w500),),
                InkWell(child: new Text("Text 3"),onTap:()=> debugPrint("Press 4"),
                )
              ],
            )
      ),
        floatingActionButton: new FloatingActionButton(
        onPressed:() =>debugPrint("Press 5"),
          backgroundColor: Colors.lightGreenAccent,
          tooltip: "Text 2",
          child: new Icon(Icons.wb_sunny),

     ),

       bottomNavigationBar: new BottomNavigationBar(items:[
            new BottomNavigationBarItem(icon: new Icon(Icons.beach_access), title: new Text("Press1")),
            new BottomNavigationBarItem(icon: new Icon(Icons.videocam_off), title: new Text("Press2")),
            new BottomNavigationBarItem(icon: new Icon(Icons.select_all), title: new Text("Press3")),
            ],onTap: (int i)=> debugPrint("PressNo $i"),

       ),
      );

  }

}
