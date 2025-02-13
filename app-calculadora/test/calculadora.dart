
import 'dart:math';

import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String _displayText = '0';
  double _num1 = 0;
  double _num2 = 0;
  String _operator = '';

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _displayText = '0';
        _num1 = 0;
        _num2 = 0;
        _operator = '';
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '*' ||
          buttonText == '/') {
        _num1 = double.parse(_displayText);
        _operator = buttonText;
        _displayText = '0';
      } else if (buttonText == '=') {
        _num2 = double.parse(_displayText);
        double result = _calculate();
        _displayText = result.toString();
        _num1 = result;
        _operator = '';
      } else if (buttonText == '√') {
        double number = double.parse(_displayText);
        double result = sqrt(number);
        _displayText = result.toString();
      } else if (buttonText == 'sin') {
        double angle = double.parse(_displayText);
        double result = sin(angle);
        _displayText = result.toString();
      } else if (buttonText == 'cos') {
        double angle = double.parse(_displayText);
        double result = cos(angle);
        _displayText = result.toString();
      } else if (buttonText == 'tan') {
        double angle = double.parse(_displayText);
        double result = tan(angle);
        _displayText = result.toString();
      } else {
        if (_displayText == '0') {
          _displayText = buttonText;
        } else {
          _displayText += buttonText;
        }
      }
    });
  }

  double _calculate() {
    switch (_operator) {
      case '+':
        return _num1 + _num2;
      case '-':
        return _num1 - _num2;
      case '*':
        return _num1 * _num2;
      case '/':
        return _num1 / _num2;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_displayText, style: TextStyle(fontSize: 48)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildButton('7'),
                _buildButton('8'),
                _buildButton('9'),
                _buildButton('/'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildButton('4'),
                _buildButton('5'),
                _buildButton('6'),
                _buildButton('*'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildButton('1'),
                _buildButton('2'),
                _buildButton('3'),
                _buildButton('-'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildButton('C'),
                _buildButton('0'),
                _buildButton('='),
                _buildButton('+'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildButton('√'),
                _buildButton('sin('),
                _buildButton('cos('),
                _buildButton('tan('),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String buttonText) {
    return ElevatedButton(
      onPressed: () => _onButtonPressed(buttonText),
      child: Text(buttonText, style: TextStyle(fontSize: 24)),
    );
  }
}
