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

  void _changeContainer() {
    final random = Random();

    _width = random.nextInt(350).toDouble();
    _height = random.nextInt(350).toDouble();
    _color = Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    _borderRadius = BorderRadius.circular(random.nextInt(20).toDouble());
    setState(() {});
  }

  @override
  final random = Random();

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animated Container'),
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
              child: Text("Generate a new shape"),
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
