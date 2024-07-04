import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:menuavigation/screens/drawer/sidemenu.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String userInput = "";
  String result = "0";

  List<String> buttonList = [
    'C',
    '(',
    ')',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '-',
    'AC',
    '0',
    '.',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: SideMenu(),
        appBar: AppBar(
          title: Text(
            "Calculator",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xff8563ab),
        ),
        body: Column(
          children: [
            Flexible(
              flex: 2,
              child: resultWidget(),
            ),
            Flexible(
              flex: 5,
              child: buttonsWidget(),
            )
          ],
        ),
      ),
    );
  }

  Widget resultWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerRight,
          child: Text(
            userInput,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.08,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerRight,
          child: Text(
            result,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.12,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  Widget buttonsWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: GridView.builder(
        itemCount: buttonList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return button(buttonList[index]);
        },
      ),
    );
  }

  Widget button(String text) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: MaterialButton(
        onPressed: () {
          setState(() {
            handleButtonPress(text);
          });
        },
        color: getColor(text),
        textColor: Colors.white,
        child: Text(
          text,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.07,
          ),
        ),
        shape: const CircleBorder(),
      ),
    );
  }

  void handleButtonPress(String text) {
    // Reset all
    if (text == "AC") {
      userInput = "";
      result = "0";
      return;
    }

    if (text == "C") {
      //Remove last char
      if (userInput.isNotEmpty) {
        userInput = userInput.substring(0, userInput.length - 1);
      }
      return;
    }
    if (text == "=") {
      //Calculate the result
      result = calculate();
      if (result.endsWith(".0")) result = result.replaceAll(".0", "");
      return;
    }

    userInput += text;
  }

  String calculate() {
    try {
      var exp = Parser().parse(userInput);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return "error";
    }
  }

  Color getColor(String text) {
    if (text == "/" ||
        text == "*" ||
        text == "+" ||
        text == "-" ||
        text == "=") {
      return Color(0xffB81736);
    }
    if (text == "C" || text == "AC") {
      return Colors.red;
    }
    if (text == "(" || text == ")") {
      return Colors.blueGrey;
    }
    return Colors.lightBlue;
  }
}
