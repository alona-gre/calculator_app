import 'package:calculator_app/widgets/number_buttons.dart';
import 'package:calculator_app/widgets/round_button.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int? firstOperand;
  String? operator;
  int? secondOperand;
  int? result;

  String _buildDisplayText() {
    if (result != null) {
      return '$result';
    }
    if (secondOperand != null) {
      return '$firstOperand$operator$secondOperand';
    }
    if (operator != null) {
      return '$firstOperand$operator';
    }

    if (firstOperand != null) {
      return '$firstOperand';
    }
    return '0';
  }

  void numberPressed(int numberBeingPresssed) {
    if (firstOperand == null) {
      setState(() {
        firstOperand = numberBeingPresssed;
      });
      return;
    }
    if (operator == null) {
      setState(() {
        firstOperand = int.parse('$firstOperand$numberBeingPresssed');
      });
      return;
    }
    if (secondOperand == null) {
      setState(() {
        secondOperand = numberBeingPresssed;
      });
      return;
    }
    setState(() {
      secondOperand = int.parse('$secondOperand$numberBeingPresssed');
    });
  }

  void clearCalculation() {
    setState(() {
      firstOperand = null;
      secondOperand = null;
      operator = null;
      result = null;
    });
  }

  void calculateResult() {
    if (firstOperand == null || secondOperand == null) {
      return;
    }
    if (operator == '+') {
      setState(() {
        result = firstOperand! + secondOperand!;
      });
    }
    if (operator == '-') {
      setState(() {
        result = firstOperand! - secondOperand!;
      });
    }
    if (operator == '*') {
      setState(() {
        result = firstOperand! * secondOperand!;
      });
    }
    if (operator == '/') {
      setState(() {
        result = firstOperand! ~/ secondOperand!;
      });
    }
  }

  void operatorPressed(String operator) {
    setState(() {
      this.operator = operator;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Align(
          alignment: Alignment.bottomRight,
          child: Text(_buildDisplayText()),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: <Widget>[
                  NumberButton(
                    action: () => numberPressed(7),
                    label: '7',
                  ),
                  NumberButton(
                    action: () => numberPressed(8),
                    label: '8',
                  ),
                  NumberButton(
                    action: () => numberPressed(9),
                    label: '9',
                  ),
                  RoundButton(
                    action: () => operatorPressed('*'),
                    label: '*',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: <Widget>[
                  NumberButton(
                    action: () => numberPressed(4),
                    label: '4',
                  ),
                  NumberButton(
                    action: () => numberPressed(5),
                    label: '5',
                  ),
                  NumberButton(
                    action: () => numberPressed(6),
                    label: '6',
                  ),
                  RoundButton(
                    action: () => operatorPressed('/'),
                    label: '/',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: <Widget>[
                  NumberButton(
                    action: () => numberPressed(1),
                    label: '1',
                  ),
                  NumberButton(
                    action: () => numberPressed(2),
                    label: '2',
                  ),
                  NumberButton(
                    action: () => numberPressed(3),
                    label: '3',
                  ),
                  RoundButton(
                    action: () => operatorPressed('+'),
                    label: '+',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: <Widget>[
                  RoundButton(
                    action: () => calculateResult(),
                    label: '=',
                  ),
                  RoundButton(
                    action: () => numberPressed(0),
                    label: '0',
                  ),
                  RoundButton(
                    action: () => clearCalculation(),
                    label: 'C',
                  ),
                  RoundButton(
                    action: () => operatorPressed('-'),
                    label: '-',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
