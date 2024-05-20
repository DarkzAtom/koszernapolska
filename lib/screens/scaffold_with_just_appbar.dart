import 'package:flutter/material.dart';
import 'package:koszernapolska/screens/naszdrawer.dart';
import 'package:go_router/go_router.dart';

Object pop = () {
  
};

class ScaffoldwithjustAppBar extends StatelessWidget {
  const ScaffoldwithjustAppBar({super.key, required this.title, required this.goBackToButton, required this.child});

  final Widget child;
  final String title;
  final dynamic goBackToButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () async{
            if (goBackToButton is String) {
              await Future.delayed(Duration(milliseconds: 200));
              context.go(goBackToButton);
            }
            else if (goBackToButton == pop) {
              await Future.delayed(Duration(milliseconds: 200));
              Navigator.pop(context);
            }
          },
        ) ,
        backgroundColor:  const Color.fromARGB(255, 0, 64, 164),
        title: Text(title),
        foregroundColor: Colors.white,
      ),
      endDrawer: NaszDrawer(),
      body: Container(
        color: Color.fromARGB(255, 16, 16, 16),
        height: double.infinity,
        width: double.infinity,
        child: child,
        ),
      );
    }
  }