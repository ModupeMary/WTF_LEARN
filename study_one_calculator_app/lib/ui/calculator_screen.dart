import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String displayText = ''; // Text shown in display
  double? num1;
  double? num2;
  String operator = '';

  // Simple math functions
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;
  double divide(double a, double b) => a / b;
  double modulo(double a, double b) => a % b;

  void onButtonPressed(String value) {
    setState(() {
      if (['+', '-', '*', '/', '%'].contains(value)) {
        // Store first number and operator
        num1 = double.tryParse(displayText);
        operator = value;
        displayText = '';
      } else if (value == '=') {
        num2 = double.tryParse(displayText);
        if (num1 != null && num2 != null) {
          switch (operator) {
            case '+':
              displayText = add(num1!, num2!).toString();
              break;
            case '-':
              displayText = subtract(num1!, num2!).toString();
              break;
            case '*':
              displayText = multiply(num1!, num2!).toString();
              break;
            case '/':
              displayText = divide(num1!, num2!).toString();
              break;
            case '%':
              displayText = modulo(num1!, num2!).toString();
              break;
          }
        }
        // Reset
        num1 = null;
        num2 = null;
        operator = '';
      } else if (value == 'C') {
        displayText = '';
        num1 = null;
        num2 = null;
        operator = '';
      } else {
        // Append number
        displayText += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const numberColor = Colors.orange;
    const operatorColor = Colors.lightBlue;
    const displayColor = Color(0xFFFFFDD0); // Cream

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Display container
            Container(
              width: double.infinity,
              color: displayColor,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    displayText,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Buttons
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    buildButtonRow(['7', '8', '9', '/'], numberColor, operatorColor),
                    buildButtonRow(['4', '5', '6', '*'], numberColor, operatorColor),
                    buildButtonRow(['1', '2', '3', '-'], numberColor, operatorColor),
                    buildButtonRow(['0', '%', 'C', '+'], numberColor, operatorColor),
                    buildButtonRow(['='], operatorColor, operatorColor),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to build rows of buttons
  Widget buildButtonRow(List<String> values, Color numberColor, Color operatorColor) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: values.map((val) {
          bool isOperator = ['+', '-', '*', '/', '%', '=', 'C'].contains(val);
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ElevatedButton(
                onPressed: () => onButtonPressed(val),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isOperator ? operatorColor : numberColor,
                  padding: const EdgeInsets.symmetric(vertical: 24),
                ),
                child: Text(
                  val,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
