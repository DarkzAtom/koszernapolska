import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koszernapolska/screens/scaffold_with_just_appbar.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldwithjustAppBar(
      title: 'Odwiedź nas', 
      goBackToButton: '/news',
      child: Center(child: Text('tutaj bedzie informacja o tym jak odwiedzic gminę', style: TextStyle(color: Colors.white)))
      );
    
  }
}