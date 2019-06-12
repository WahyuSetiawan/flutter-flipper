import 'package:flutter/material.dart';
import 'flipper.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flip Animation'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final digits = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
  ];
  final String title;

  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: Center(
          child: GestureDetector(
            onVerticalDragUpdate: (dragUpdateDetails) {
              print(dragUpdateDetails.delta.dy);
            },
            child: FlipPanel.builder(
              itemBuilder: (context, index) => Container(
                    alignment: Alignment.center,
                    width: 96.0,
                    height: 128.0,
                    // width: 200.0,
                    // height: 400.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    child: Text(
                      '${digits[index]}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 80.0,
                          color: Colors.yellow),
                    ),
                  ),
              itemsCount: digits.length,
              period: Duration(milliseconds: 1000),
              loop: -1,
            ),
          ),
        ));
  }
}
