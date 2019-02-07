import "package:flutter/material.dart";

void main() => runApp(new MaterialApp(
      title: "Calculator",
      debugShowCheckedModeBanner: false,
      home: new Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String output = "0";
  String result = "";
  String _result = "";
  String _output = "0";
  double no1 = 0.0;
  double no2 = 0.0;
  String operand = "";
  bool newNo = true;
  buttonPressed(String buttontext) {
    result = result + buttontext;
    if (buttontext == "CLEAR") {
      output = "0";
      _output = "0";
      no1 = 0.0;
      no2 = 0.0;
      operand = "";
      result = "";
    } else if (buttontext == "+" ||
        buttontext == "-" ||
        buttontext == "X" ||
        buttontext == "/") {
      newNo = true;
      no1 = double.parse(output);
      operand = buttontext;
      _output = "0";
    } else if (buttontext == ".") {
      if (_output.contains(".")) {
        print("already a decimal there");
        return;
      } else {
        _output = _output + buttontext;
      }
    } else if (buttontext == "=") {
      no2 = double.parse(output);

      if (operand == "+") {
        _output = (no1 + no2).toString();
      }
      if (operand == "-") {
        _output = (no1 - no2).toString();
      }
      if (operand == "X") {
        _output = (no1 * no2).toString();
      }
      if (operand == "/") {
        _output = (no1 / no2).toString();
      }
      result = result + _output + " \n";
      no2 = 0.0;
      no1 = double.parse(_output);
      operand = "";
      newNo = false;
    } else {
      if (newNo == false) {
        output = "0";
        _output = "0";
        no1 = 0.0;
        no2 = 0.0;
        operand = "";
        newNo = true;
      }

      _output = _output + buttontext;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
      _result = result;
    });
  }

  Widget buildButton(var str) {
    return new Expanded(
        child: Container(
          color: Colors.blue[200],
          child: OutlineButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      padding: EdgeInsets.all(24.0),
      splashColor: Colors.lightBlueAccent,
      highlightedBorderColor: Colors.cyan,
      onPressed: () => buttonPressed(str),
      child: new Text(
          str,
          style: new TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold,),
      ),
      color: Colors.white70,
    ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Calculator"),
        centerTitle: true,
        backgroundColor:Color(0xFF81D4FA),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [const Color(0xFFFFFFFF), const Color(0x234cdaFF)],
              ),
            ),
          ),
          Container(
            child: new Column(
              children: <Widget>[
                new Expanded(
                  child: SingleChildScrollView(
                    reverse: true,
                    primary: false,
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: new Text(
                        _result,
                        style: new TextStyle(fontSize: 20.0),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
                Divider(),
                new Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(
                      vertical: 14.0,
                      horizontal: 12.0,
                    ),
                    child: new Text(
                      output,
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 48.0),
                    )),
                new Row(
                  children: <Widget>[
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("/")
                  ],
                ),
                new Row(
                  children: <Widget>[
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("X")
                  ],
                ),
                new Row(
                  children: <Widget>[
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-")
                  ],
                ),
                new Row(
                  children: <Widget>[
                    buildButton("."),
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("+")
                  ],
                ),
                new Row(
                  children: <Widget>[buildButton("CLEAR"), buildButton("=")],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
