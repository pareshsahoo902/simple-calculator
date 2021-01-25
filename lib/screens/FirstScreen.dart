import 'package:flutter/material.dart';


class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String calcText = "0";

  String _calcText = "0";
  double operand1 = 0.0;
  double operand2 = 0.0;
  String operator = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text(
          "Simple Calculator",
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                calcText,
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 47.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton("AC", Colors.pink, Colors.white),
                // calcButton("<x", Colors.pink, Colors.white),
                calcButton("+/-", Colors.pink, Colors.white),
                calcButton("÷", Colors.pink, Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton("7", Colors.indigo, Colors.white),
                calcButton("8", Colors.indigo, Colors.white),
                calcButton("9", Colors.indigo, Colors.white),
                calcButton("×", Colors.pink, Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton("4", Colors.indigo, Colors.white),
                calcButton("5", Colors.indigo, Colors.white),
                calcButton("6", Colors.indigo, Colors.white),
                calcButton("-", Colors.pink, Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton("1", Colors.indigo, Colors.white),
                calcButton("2", Colors.indigo, Colors.white),
                calcButton("3", Colors.indigo, Colors.white),
                calcButton("+", Colors.pink, Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton("0", Colors.indigo, Colors.white),
                calcButton("00", Colors.indigo, Colors.white),
                calcButton(".", Colors.indigo, Colors.white),
                calcButton("=", Colors.pink, Colors.white),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget calcButton(String btnname, Color btncolor, Color txtcolor) {
    return Expanded(
      child: RaisedButton(
        padding: EdgeInsets.all(20.0),
        child: Text(
          btnname,
          style: TextStyle(fontSize: 21.0, color: txtcolor),
        ),
        onPressed: () {
          onButtonPress(btnname);
        },
        color: btncolor,
      ),
    );
  }

  void onButtonPress(String btnname) {
    if (btnname == "AC") {
      _calcText = "0";
      operand1 = 0.0;
      operand2 = 0.0;
      operator = "";
    } else if (btnname == "+" ||
        btnname == "-" ||
        btnname == "×" ||
        btnname == "÷") {
      operand1 = double.parse(calcText);
      operator = btnname;
      _calcText = "0";
    } else if (btnname == ".") {
      if (_calcText.contains(".")) {
        print(". added");

        return;
      }
      else{
        _calcText = _calcText+btnname;
        calcText=_calcText;
      }

    }
    else if(btnname == "="){
      operand2 = double.parse(calcText);

      if(operator == "+"){
        _calcText = (operand1+operand2).toString();
      }
      if(operator == "-"){
        _calcText = (operand1-operand2).toString();
      }
      if(operator == "×"){
        _calcText = (operand1*operand2).toString();
      }
      if(operator == "÷"){
        _calcText = (operand1/operand2).toString();
      }


      operand1 = 0.0;
      operand2 = 0.0;
      operator = "";
    }
    else{
      _calcText = _calcText + btnname;
    }


    setState(() {
      if(double.parse(_calcText)%1!=0){
        calcText = double.parse(_calcText).toStringAsFixed(2);

      }
      else{
        calcText = double.parse(_calcText).toInt().toString();
      }


    });
  }

}

