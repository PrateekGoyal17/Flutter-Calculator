import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String equation = "0";
  String result = "0";
  String expression = "";
  int maxLen = 80;

  buttonPressed(btnText) {
    setState(() {
      if (equation.length < maxLen) {
        if (btnText == "C") {
          equation = "0";
          result = "0";
        } else if (btnText == "⌫") {
          equation = equation.substring(0, equation.length - 1);
          if (equation == "") {
            equation = "0";
          }
        } else if (btnText == "=") {
          try {
            expression = equation;
            expression = expression.replaceAll("x", "*");

            Parser p = Parser();
            Expression exp = p.parse(expression);
            ContextModel cm = ContextModel();
            result = "${exp.evaluate(EvaluationType.REAL, cm)}";
          } catch (e) {
            result = "Invalid expression";
          }
        } else {
          if (equation == "0") {
            equation = btnText;
          } else {
            equation = equation + btnText;
          }
        }
      } else {
        // we can setup max length reach through a snakbar
      }
    });
  }

  Widget Chips({
    required String chipsText,
    required Color textColor,
    required Color buttonColor,
    required double buttonHeight,
    required double buttonWidth,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: buttonHeight,
        width: buttonWidth,
        child: ElevatedButton(
          onPressed: () {
            buttonPressed(chipsText);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(buttonColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ),
          child: Text(
            chipsText,
            style: TextStyle(fontSize: 23, color: textColor),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //display input values
            SingleChildScrollView(
              child: Container(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 30, right: 30, bottom: 10),
                    child: Text(
                      equation,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 23,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30, bottom: 35),
                    child: Text(
                      result,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),

            // buttons
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Chips(
                      chipsText: "C",
                      textColor: Color(0xFFB1322A),
                      buttonColor: Color(0xFFE2E4F3),
                      buttonHeight: MediaQuery.of(context).size.height * 0.088,
                      buttonWidth: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Chips(
                      chipsText: "⌫",
                      textColor: Colors.black,
                      buttonColor: Color(0xFFE2E4F3),
                      buttonHeight: MediaQuery.of(context).size.height * 0.088,
                      buttonWidth: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Chips(
                      chipsText: "%",
                      textColor: Colors.black,
                      buttonColor: Color(0xFFE2E4F3),
                      buttonHeight: MediaQuery.of(context).size.height * 0.088,
                      buttonWidth: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Chips(
                      chipsText: "/",
                      textColor: Colors.black,
                      buttonColor: Color(0xFFFE4E01),
                      buttonHeight: MediaQuery.of(context).size.height * 0.088,
                      buttonWidth: MediaQuery.of(context).size.width * 0.2,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Chips(
                      chipsText: "7",
                      textColor: Colors.black,
                      buttonColor: Color(0xFFE2E4F3),
                      buttonHeight: MediaQuery.of(context).size.height * 0.088,
                      buttonWidth: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Chips(
                      chipsText: "8",
                      textColor: Colors.black,
                      buttonColor: Color(0xFFE2E4F3),
                      buttonHeight: MediaQuery.of(context).size.height * 0.088,
                      buttonWidth: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Chips(
                      chipsText: "9",
                      textColor: Colors.black,
                      buttonColor: Color(0xFFE2E4F3),
                      buttonHeight: MediaQuery.of(context).size.height * 0.088,
                      buttonWidth: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Chips(
                      chipsText: "x",
                      textColor: Colors.black,
                      buttonColor: Color(0xFFFE4E01),
                      buttonHeight: MediaQuery.of(context).size.height * 0.088,
                      buttonWidth: MediaQuery.of(context).size.width * 0.2,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Chips(
                      chipsText: "4",
                      textColor: Colors.black,
                      buttonColor: Color(0xFFE2E4F3),
                      buttonHeight: MediaQuery.of(context).size.height * 0.088,
                      buttonWidth: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Chips(
                      chipsText: "5",
                      textColor: Colors.black,
                      buttonColor: Color(0xFFE2E4F3),
                      buttonHeight: MediaQuery.of(context).size.height * 0.088,
                      buttonWidth: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Chips(
                      chipsText: "6",
                      textColor: Colors.black,
                      buttonColor: Color(0xFFE2E4F3),
                      buttonHeight: MediaQuery.of(context).size.height * 0.088,
                      buttonWidth: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Chips(
                      chipsText: "-",
                      textColor: Colors.black,
                      buttonColor: Color(0xFFFE4E01),
                      buttonHeight: MediaQuery.of(context).size.height * 0.088,
                      buttonWidth: MediaQuery.of(context).size.width * 0.2,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Chips(
                      chipsText: "1",
                      textColor: Colors.black,
                      buttonColor: Color(0xFFE2E4F3),
                      buttonHeight: MediaQuery.of(context).size.height * 0.088,
                      buttonWidth: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Chips(
                      chipsText: "2",
                      textColor: Colors.black,
                      buttonColor: Color(0xFFE2E4F3),
                      buttonHeight: MediaQuery.of(context).size.height * 0.088,
                      buttonWidth: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Chips(
                      chipsText: "3",
                      textColor: Colors.black,
                      buttonColor: Color(0xFFE2E4F3),
                      buttonHeight: MediaQuery.of(context).size.height * 0.088,
                      buttonWidth: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Chips(
                      chipsText: "+",
                      textColor: Colors.black,
                      buttonColor: Color(0xFFFE4E01),
                      buttonHeight: MediaQuery.of(context).size.height * 0.088,
                      buttonWidth: MediaQuery.of(context).size.width * 0.2,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Chips(
                      chipsText: "0",
                      textColor: Colors.black,
                      buttonColor: Color(0xFFE2E4F3),
                      buttonHeight: MediaQuery.of(context).size.height * 0.088,
                      buttonWidth: MediaQuery.of(context).size.width * 0.44,
                    ),
                    Chips(
                      chipsText: ".",
                      textColor: Colors.black,
                      buttonColor: Color(0xFFE2E4F3),
                      buttonHeight: MediaQuery.of(context).size.height * 0.088,
                      buttonWidth: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Chips(
                      chipsText: "=",
                      textColor: Colors.black,
                      buttonColor: Color(0xFF49934A),
                      buttonHeight: MediaQuery.of(context).size.height * 0.088,
                      buttonWidth: MediaQuery.of(context).size.width * 0.2,
                    ),
                  ],
                )
              ],
            ),
            // SizedBox(height: MediaQuery.of(context).size.height*0.00001,)
          ],
        ),
      ),
    );
  }
}
