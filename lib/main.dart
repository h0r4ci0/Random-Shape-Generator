import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _width = 100.0;
  double _height = 100.0;
  Color _color = Colors.blue;
  BorderRadius _borderRadius = BorderRadius.circular(10.0);
  Color _textColor = Colors.black;

  void _changeContainer() {
    final random = Random();

    _width = random.nextInt(350).toDouble();
    _height = random.nextInt(350).toDouble();

    int _red = random.nextInt(255);
    int _green = random.nextInt(255);
    int _blue = random.nextInt(255);

    _color = Color.fromRGBO(_red, _green, _blue, 1);
    _borderRadius = BorderRadius.circular(random.nextInt(20).toDouble());
    setState(() {});

    if (_red + _green + _blue >= 520) {
      _textColor = Colors.black;
    } 

    else {
      _textColor = Colors.white;
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animated Container'),
          foregroundColor: _textColor,
          backgroundColor: _color,
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.fastOutSlowIn,
                  width: _width,
                  height: _height,
                  decoration: BoxDecoration(
                    color: _color,
                    borderRadius: _borderRadius,
                  ),
                ),
              ),
            ),
            RaisedButton(
              onPressed: _changeContainer,
              child: Text("GENERATE A NEW SHAPE"),
              textColor: _textColor,
              color: _color,
            ),
            SizedBox(
              height: 100.0,
            )
          ],
        ),
      ),
    );
  }
}