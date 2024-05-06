import 'package:flutter/material.dart';

class MySquare extends StatefulWidget {
  const MySquare({super.key});

  @override
  State<MySquare> createState() => _MySquareState();
}

class _MySquareState extends State<MySquare> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.infinity,
      child: Container(
        height: 300,
        color: Colors.cyanAccent,
        child: Text('djfjsk')
      )       
                );
  }
}