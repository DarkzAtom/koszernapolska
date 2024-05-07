import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade200,
      child: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/news'),
           child: Text('Press to proceed')
           ),
      )
    );
  }
}