import 'package:flutter/material.dart';

void main() => runApp(new MyCalculatorApp());

class MyCalculatorApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'My Calculator',
      // ignore: argument_type_not_assignable
      home: MyCalculator()
    );
  }

}
class MyCalculator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => Calculator();
    // TODO: implement createState


}
class Calculator extends State<MyCalculator>{

  //Register Controller for Text from Field
  final controller_numberA = TextEditingController();
  final controller_numberB = TextEditingController();
  final my_form_key = GlobalKey<FormState>();


  String result = "";

  String textToShow = "";
  //Create function sum
  void Sum(){
    int numberA = int.parse(controller_numberA.text);
    int numberB = int.parse(controller_numberB.text);

    int result = numberA + numberB;

    setState(() {
      textToShow = "$numberA + $numberB = $result";
    });
  }

  void Sub(){
    int numberA = int.parse(controller_numberA.text);
    int numberB = int.parse(controller_numberB.text);

    int result = numberA - numberB;

    setState(() {
      textToShow = "$numberA - $numberB = $result";
    });
  }

  void Div(){
    int numberA = int.parse(controller_numberA.text);
    int numberB = int.parse(controller_numberB.text);

    int result = (numberA / numberB) as int;

    setState(() {
      textToShow = "$numberA / $numberB = $result";
    });
  }

  void Mul(){
    int numberA = int.parse(controller_numberA.text);
    int numberB = int.parse(controller_numberB.text);

    int result = numberA * numberB;

    setState(() {
      textToShow = "$numberA * $numberB = $result";
    });
  }
  @override
  Widget build(BuildContext context) {

    //Create layout
    return new Scaffold(body: Form(key: my_form_key,child:
      Column(mainAxisAlignment:  MainAxisAlignment.center,

        children: <Widget>[
          //Xreate 2 Text form field in Vertical
          TextFormField(
            controller: controller_numberA,
            validator: (value){
              if (value.isEmpty) return "Please Enter Number";
              },
               decoration: InputDecoration(hintText: "Enter Number",),
               keyboardType: TextInputType.number),

          TextFormField(
              controller: controller_numberB,
              validator: (value){
                if (value.isEmpty) return "Please Enter Number";
              },
              decoration: InputDecoration(hintText: "Enter Number"),
              keyboardType: TextInputType.number),


          //Create Result Text field
          Text(textToShow, style: TextStyle(fontSize: 20.0,),),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
            RaisedButton(onPressed: Sum,child: Text('+'),),
            RaisedButton(onPressed: Sub,child: Text('-'),),
            RaisedButton(onPressed: Div,child: Text('/'),),
            RaisedButton(onPressed: Mul,child: Text('*'),),
          ],)

        ],
      )
    ));
  }
}

