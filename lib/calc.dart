import 'package:calculator_f/color.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var output = "";
  double firstNum = 0.0;
  double secondNum = 0.0;
  var input = "";
  var operate = "";
  var hideInput = false;
  var outputSize = 34.0;

  onButtonClick(value) {
    if (value == "AC") {
      input = " ";
      output = " ";
    } else if (value == "<") {
      input = input.substring(0, input.length - 1);
    } else if (value == ">") {
      input = input.substring(0, input.length + 1);
    } else if (value == "=") {
      var userInput = input;
      userInput = input.replaceAll("x", "*");
      Parser p = Parser();
      Expression expression = p.parse(userInput);
      ContextModel cm = ContextModel();
      var finalValue = expression.evaluate(EvaluationType.REAL, cm);
      output = finalValue.toString();
      if (output.endsWith(".0")) {
        output = output.substring(0, output.length - 2);
        
      }
      input = output;
      hideInput = true;
      outputSize = 52;



    } else {
      input = input + value;
      hideInput = false;

      outputSize = 34;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  hideInput? '' :input,
                  style: TextStyle(fontSize: 48, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  output,
                  style: TextStyle(
                      fontSize: 28, color: Colors.white.withOpacity(0.7)),
                ),
              ],
            ),
          )),
          Row(
            children: [
              button(text: "AC", buttonColor: color1, tColor: color3),
              button(text: "<",buttonColor: color1, tColor: color3),
              button(text: ">",buttonColor: color1, tColor: color3),
              button(text: "/"),
            ],
          ),
          Row(
            children: [
              button(text: "7"),
              button(text: "8"),
              button(text: "9"),
              button(text: "x"),
            ],
          ),
          Row(
            children: [
              button(text: "4"),
              button(text: "5"),
              button(text: "6"),
              button(text: "-"),
            ],
          ),
          Row(
            children: [
              button(text: "1"),
              button(text: "2"),
              button(text: "3"),
              button(text: "+"),
            ],
          ),
          Row(
            children: [
              button(text: "%",buttonColor: color1, tColor: color3),
              button(text: "0"),
              button(text: "."),
              button(text: "=",buttonColor: color3),
            ],
          )
        ],
      ),
    );
  }

  Widget button({text, tColor = Colors.white, buttonColor = color2}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(22),
              backgroundColor: buttonColor),
          onPressed: ()=>onButtonClick (text),
          child: Text(
            text,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
