import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OGminiePage extends StatefulWidget {
  const OGminiePage({super.key});

  @override
  State<OGminiePage> createState() => _OGminiePageState();
}

class _OGminiePageState extends State<OGminiePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color.fromARGB(255, 0, 64, 164),
        title: const Text('O Gminie'),
        foregroundColor: Colors.white,
      ),
      
      body: Container(
          color: Color.fromARGB(255, 16, 16, 16),
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('gogoog'),
            ),
          ),
      ),
    );
  }
}