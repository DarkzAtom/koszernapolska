import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koszernapolska/screens/scaffold_with_just_appbar.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldwithjustAppBar(
      title: 'Kontakt',
      goBackToButton: '/news',
      child: Center(child: Text('Tutaj będzie sekcja jak się kontaktuje z gminą żydowską', style: TextStyle(color: Colors.white))),
      );
  }
}

