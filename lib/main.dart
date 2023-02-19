import 'dart:async';

import 'package:flutter/material.dart';
import 'SecondScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: MyHomepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomepage extends StatefulWidget {
  @override
  State<MyHomepage> createState() => _MyHomepageState();
}
class _MyHomepageState extends State<MyHomepage> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 2),
            () =>Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context)=>SecondScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.purple,Colors.white],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Center(
          child: Icon(
              Icons.book_rounded,
            color: Colors.green,
            size: 100,
          ),
      ),
    );
  }
}



