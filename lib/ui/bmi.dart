import 'package:flutter/material.dart';

class BMI extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return new BMIState ();
  }

}

class BMIState extends State<BMI>{
  final TextEditingController _t1Controller = new TextEditingController();
  final TextEditingController _t2Controller = new TextEditingController();
  final TextEditingController _t3Controller = new TextEditingController();

  double inches = 0.0;
  double result = 0.0;
  String _resultReading="";
  String _finalResult="";

  void calculateBMI(){
    setState(() {
      int age = int.parse(_t1Controller.text);
      double height = double.parse(_t2Controller.text);
      inches= height*12;
      double weight = double.parse(_t3Controller.text);


      if(( _t1Controller.text.isNotEmpty || age>0 ) && ( _t2Controller.text.isNotEmpty || inches>0 ) && ( _t3Controller.text.isNotEmpty || weight>0 ))
      {
        result = weight / (inches * inches) * 703; }      else {return 0.0;}


      if(double.parse(result.toStringAsFixed(1))<18.0){
        _resultReading  = "UnderWeight";
        print(_resultReading);
      }
      else if (double.parse(result.toStringAsFixed(1))>=18.0 && result <25.0){
        _resultReading  = "Great Shape!";
        print(_resultReading);
      }
      else if (double.parse(result.toStringAsFixed(1))>=25.0 && result <30.0){
        _resultReading  = "OverWeight";
        print(_resultReading);
      }
      else if(double.parse(result.toStringAsFixed(1))>30.0){
        _resultReading  = "Obese";
        print(_resultReading);
      }
      else {result=0.0;}

    });

    _finalResult = "Your BMI : ${result.toStringAsFixed(1)}";
    debugPrint("$result - $_resultReading - $_resultReading");
  }



  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),

      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            new Image.asset("images/bmilogo.png",height: 80.0,width: 85.0,),

            new Container(
              margin: const EdgeInsets.all(3.0),
              height: 250.0,width: 300.0,
              color: Colors.grey.shade200,
              child: Column(
                children: <Widget>[
                  new TextField(controller: _t1Controller,keyboardType: TextInputType.number,decoration: new InputDecoration(
                    labelText: "Age : ",hintText: "e.g. 34", icon: new Icon(Icons.person_outline),
                  ),),
                  new TextField(controller: _t2Controller,keyboardType: TextInputType.number,decoration: new InputDecoration(
                    labelText: "Height in ft. : ",hintText: "e.g. 7", icon: new Icon(Icons.insert_chart),
                  ),),
                  new TextField(controller: _t3Controller,keyboardType: TextInputType.number,decoration: new InputDecoration(
                    labelText: "Weight in lbs : ",hintText: "e.g. 88", icon: new Icon(Icons.line_weight),
                  ),),
                  new Padding(padding: new EdgeInsets.all(10.1)),

                  new Container(
                    alignment: Alignment.center,
                    child: new RaisedButton(onPressed:  calculateBMI,color: Colors.pink,
                    child: new Text("Calculate"),textColor: Colors.white,),
                  ),
                ],
              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("$_finalResult",style: new TextStyle(color: Colors.blueAccent,fontSize: 20.0,fontWeight: FontWeight.w400,fontStyle: FontStyle.italic),),
                new Padding(padding: const EdgeInsets.all(5.0)),
                new Text("$_resultReading",style: new TextStyle(color: Colors.pinkAccent,fontSize: 20.0,fontWeight: FontWeight.w400,fontStyle: FontStyle.italic),),
              ],
            ),
          ],
        ),
      ),
    );
  }

}