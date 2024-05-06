import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class NestedScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nested Screen 1'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/nestedScreen2');
          },
          child: Text('Go to Nested Screen 2'),
        ),
      ),
    );
  }
}

class NestedScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nested Screen 2'),
      ),
      body: Center(
        child: Text('This is Nested Screen 2'),
      ),
    );
  }
}