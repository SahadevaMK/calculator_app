import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'buttonText.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

List<String> buttons = [
  'C',
  'DEL',
  '%',
  '/',
  '9',
  '8',
  '7',
  'x',
  '6',
  '5',
  '4',
  '-',
  '3',
  '2',
  '1',
  '+',
  '0',
  '.',
  'ANS',
  '=',
];
String questionText = '';
String answerText = '';

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Text(questionText,
                    style: TextStyle(
                      fontSize: 30
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(8),
                ),
                Container(
                  child: Text(answerText,style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.all(8),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              // color: Colors.deepPurple,
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return buttonText(
                        buttonTapped: (){
                          setState(() {
                            questionText = '';
                          });
                        },
                          color: Colors.green,
                          textButton: buttons[0],
                          textColor: Colors.white);

                    } else if (index == 1) {
                      return buttonText(
                        buttonTapped: (){
                          setState(() {
                            questionText = questionText.substring(0,questionText.length-1);
                          });
                        },
                          color: Colors.red,
                          textButton: buttons[1],
                          textColor: Colors.white);
                    }else if(index==buttons.length-1){
                      return buttonText(
                        buttonTapped: (){
                          setState(() {
                            equalPressed();
                          });
                        },
                        textButton: buttons[index],
                        color: isOperator(buttons[index])
                            ? Colors.deepPurple
                            : Colors.deepPurple[50],
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.deepPurple,
                      );
                    }
                    else {
                      return buttonText(
                        buttonTapped: (){
                          setState(() {
                            questionText += buttons[index];
                          });
                        },
                        textButton: buttons[index],
                        color: isOperator(buttons[index])
                            ? Colors.deepPurple
                            : Colors.deepPurple[50],
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.deepPurple,
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }
  void equalPressed(){
    String userQuestion = questionText;
    Parser p = Parser();
    Expression exp = p.parse(userQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answerText=eval.toString();
  }
}
