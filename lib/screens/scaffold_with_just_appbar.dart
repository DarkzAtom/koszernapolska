import 'package:flutter/material.dart';
import 'package:koszernapolska/screens/naszdrawer.dart';
import 'package:go_router/go_router.dart';


class ScaffoldwithjustAppBar extends StatelessWidget {
  const ScaffoldwithjustAppBar({super.key, required this.title, this.goBackToButton, required this.child});

  final Widget child;
  final String title;
  final String? goBackToButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  goBackToButton != null ? IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.go(goBackToButton!);
          },
        ) : null ?? null,
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