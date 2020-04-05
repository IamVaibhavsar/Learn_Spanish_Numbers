import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: MyButton(),
  ));
}

class MyButton extends StatefulWidget{
  //once all the states are defined, we can call these state 
  @override
  //call of the method createState is mandatory.it expect you to pass createState
  MyButtonState createState(){
      return MyButtonState();   //previous versions- return new MyButtonState();
  }
}

//Maintaining state of the button
//brain of the application: extends the state
class MyButtonState extends State<MyButton>{
  int counter = 0;
  List<String> spanishNumbers = [
    "uno",
    "dos",
    "tres",
    "cuatro",
    "cinco",
    "seis",
    "seite",
    "ocho",
    "nueve",
    "diez"
  ];
  String defaultText = "Spanish Numbers";

  // custom method for the button
  void displaySNumbers() 
  {
    //these 10 variables are part of state
    //to change anything - we can setstate()
    setState(() {
      defaultText = spanishNumbers[counter];
       if (counter<9) {
         counter = counter +1;
       }
       else{
         counter = 0;
       }
    });
  }

  @override
  //@override: methods or widgets are already designed
  //widget requires atleast one build method
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Spanish Numbers'),
        backgroundColor: Colors.orange,
      ) ,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(defaultText, style: TextStyle(fontSize: 30.0)),
              Padding(padding: EdgeInsets.all(10.0),),
              RaisedButton(
                child: Text('Call Numbers', style: TextStyle(
                  color: Colors.black
                ),),
                //onPressed: (){},
                onPressed: displaySNumbers,   //no parenthesis while calling
                color: Colors.orange,
                )
              //all values are double
              //padding from all the sides
            ],
          )),
      )
      );
  }



}