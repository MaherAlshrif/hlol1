import 'package:flutter/material.dart';

class Planet extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return new PlanetState ();
  }

}

class PlanetState extends State<Planet> {
  final TextEditingController _weightController = new TextEditingController();
  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText="";


  void handleRadioValueChanged(int value){
    setState(() {
      radioValue = value;

      switch(radioValue){
        case 0 : 
          _finalResult = calculareWhight(_weightController.text,0.06);
          _formattedText= "Your Weight o Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1 :
          _finalResult = calculareWhight(_weightController.text,0.38);
          _formattedText= "Your Weight o Mars is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 2 :
          _finalResult = calculareWhight(_weightController.text,0.91);
          _formattedText= "Your Weight o Vinus is ${_finalResult.toStringAsFixed(1)}";
          break;
      }
    });
  }

  double calculareWhight(String weight,double multiplier) {
    if(int.parse(weight).toString().isNotEmpty && int.parse(weight)>0){
      return int.parse(weight) * multiplier;
    }else{
      print("Error");
      return int.parse("180") * 0.38;
    }

  }


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Text 1"),
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
      ),

      backgroundColor: Colors.blueGrey.shade200,

      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(3.0),
          children: <Widget>[
            new Image.asset('images/planet.png',height: 150.0,width: 200.0,),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  new TextField(controller: _weightController,keyboardType: TextInputType.number,
                    decoration: new InputDecoration(labelText: "Weight on Eart : ",hintText: "In Killo"),),

                  new Padding(padding: EdgeInsets.all(5.0)),

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                      new Radio<int>(
                          activeColor: Colors.orange,
                          value: 0,groupValue: radioValue, onChanged: handleRadioValueChanged),
                          new Text("Pluto",style: new TextStyle(color: Colors.white),),
                        
                      new Radio<int>(
                          activeColor: Colors.red,
                          value: 1,groupValue: radioValue, onChanged: handleRadioValueChanged),
                          new Text("Mars",style: new TextStyle(color: Colors.white),),

                      new Radio<int>(
                          activeColor: Colors.orangeAccent,
                          value: 2,groupValue: radioValue, onChanged: handleRadioValueChanged),
                          new Text("Venus",style: new TextStyle(color: Colors.white),),
                    ],
                  ),

                  new Padding(padding: EdgeInsets.all(5.0)),

                  new Text("$_formattedText Klg",style: new TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.w300),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}