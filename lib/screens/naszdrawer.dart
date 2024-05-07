import 'package:flutter/material.dart';
import 'package:koszernapolska/widgets/ogminie.dart';
import 'package:go_router/go_router.dart';






class NaszDrawer extends StatelessWidget {
  const NaszDrawer({super.key});
 

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: Color.fromARGB(255, 16, 16, 16),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Hello', style: TextStyle(color: Colors.white, fontSize: 24),),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 64, 164)
              ),
              ),
              ListTile(
                onTap: ()  async { // add 'async' in case if latency is needed
                  await Future.delayed(Duration(milliseconds: 200));
                  context.go('/about');
                  }, // this is the example how you link the tile to the page number in the body of your program
                title: Text('O Gminie', style: TextStyle(color: const Color.fromARGB(230, 255, 255, 255 )))
              ),
              ListTile(
                onTap: ()  async { // add 'async' in case if needed
                  await Future.delayed(Duration(milliseconds: 200));
                  context.go('/about');
                  }, 
                title: Text('jskaas;sad', style: TextStyle(color: const Color.fromARGB(230,255, 255, 255)))
              )
          ]
        ),
    );
  }
}

