import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return new LoginState ();
  }

}

class LoginState extends State<Login> {

  final TextEditingController _t1Controller = new TextEditingController();
  final TextEditingController _t2Controller = new TextEditingController();
  String _wellcomeString = "";

  void _clear(){
    setState(() {
      _t1Controller.clear();
      _t2Controller.clear();
    });
  }

  void _wellcome(){
    setState((){
      if (_t1Controller.text.isNotEmpty && _t2Controller.text.isNotEmpty){
        _wellcomeString = _t1Controller.text;
      } else {
        _wellcomeString="Nothing!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: Text("AppText"),
        backgroundColor: Colors.lightBlueAccent.shade200,

      ),

      backgroundColor: Colors.blue.shade50,

      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Image.asset("face.png",width: 90.0,height: 90.0,color:Colors.lime),
            new Container(
              height: 180.0, width: 380.0,color: Colors.white54,
              child: new Column(
                children: <Widget>[
                  new TextField( controller: _t1Controller,decoration: new InputDecoration( hintText: "User Name",icon: new Icon(Icons.person)),),
                  new TextField( controller: _t2Controller,decoration: new InputDecoration( hintText: "Password",icon: new Icon(Icons.lock),),obscureText: true,),
                  
                  new Padding(padding: EdgeInsets.all(10.5)),

                  new Center(
                    child: new Row(
                       children: <Widget>[
                         new Container(
                           margin: const EdgeInsets.only(left:38.0),
                           child: new RaisedButton(onPressed: _wellcome,color: Colors.redAccent,child: new Text("Login",style: new TextStyle(color: Colors.white,fontSize: 16.0),),),
                         ),
                         new Container(
                           margin: const EdgeInsets.only(left:100.0),
                           child: new RaisedButton(onPressed: _clear,color: Colors.redAccent,child: new Text("Clear",style: new TextStyle(color: Colors.white,fontSize: 16.0),),),
                         )
                       ],
                    ),
                  )
                ],
              ),
            ),
            
            new Padding(padding: EdgeInsets.all(30.0)),


            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("WellCome $_wellcomeString",style: new TextStyle(color: Colors.blueAccent,fontSize: 20.0,fontWeight: FontWeight.w600),)
              ],
            )
          ],
        ),
      )

    );
  }
}