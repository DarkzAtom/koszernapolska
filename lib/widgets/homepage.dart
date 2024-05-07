import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:koszernapolska/screens/naszdrawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:async';
import '../globals.dart' as globals;
import 'ogminie.dart'; 
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:go_router/go_router.dart';
import 'homepage.dart' as HomePage;
import 'foodpage.dart' as FoodPage;
import 'calendarpage.dart' as CalendarPage;
import 'scanerpage.dart' as ScanerPage;
class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  int currentPageIndex = 0;
  int testowa = 0;
  final List<String> _aktualki = ['Ghajskd', 'Shjs', 'Sdfs', 'I dont care', 'Sdsfsd', 'Sddfgdgdg','Ssdasdas'];



  @override
  Widget build(BuildContext context) {
    return  Container(
              color: Color.fromARGB(255, 16, 16, 16),
              child: ListView.builder(
                    padding: EdgeInsets.only(top: 8, bottom: 8),   // **tile-identation** i could've added the const here but as far as i understood i have to declare at the very very top, it's not usable
                    itemCount: _aktualki.length,
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color.fromARGB(255, 31, 31, 31)),
                        margin: EdgeInsets.all(8), // **tile-indentation** and here. SO IF YOU WANT to change the margin of the tile/ indent of a tile from the sides and between each other - than change those 2 params
                        clipBehavior: Clip.hardEdge,
                        child: Column(
                          children: [
                            Container(
                              color: Color.fromARGB(255, 31, 31, 31),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 6),
                                  child: Text('Title', style: TextStyle(color: Colors.white, fontSize: 22))
                                ),
                              ),
                            ),
                            // Divider(indent: 6, endIndent: 6, color: Color.fromARGB(255, 88, 88, 88)),
                            
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  child: Text(''),
                                  color: Color.fromARGB(255, 31, 31, 31),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Color.fromARGB(255, 37, 37, 37)),
                                    padding: EdgeInsets.all(6),
                                     // Change this to your desired background color
                                    child: Text('${' '*1}Your information goes here and i will show to tou that nothing is impossible to ahcghsjdf sdfs sjaskf sjdf sdjf sdgs sn', style: TextStyle(color: const Color.fromARGB(230, 255, 255, 255)),),
                                    
                                  ),
                                ),
                                Container(
                                  width: 10,
                                  child: Text(''),
                                  color: Color.fromARGB(255, 31, 31, 31),
                                )
                              ],
                            ),
                            
          
                            // Divider(indent: 6, endIndent: 6, color: Color.fromARGB(255, 88, 88, 88),),
                            Row(children: [
                              Container(
                              color: const Color.fromARGB(255, 31, 31, 31),
                              child: Align( 
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Text('Źródło:', style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 32,
                              margin: EdgeInsets.only(top: 7, bottom: 7),
                              child: ElevatedButton(onPressed: () {
                                final Uri? uri = Uri.tryParse('https://natribu.org');
                                if (uri != null){
                                  launchUrl(uri);
                                }
                              }, child: Text('Odwiedź stronę', style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 129, 131, 194)),),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.pressed))
                                      return Color.fromARGB(255, 39, 39, 39);
                                    return Color.fromARGB(255, 36, 36, 36); // Use the component's default.
                                  },
                                ),
                              )),
                            ),
                            ],)
                            
                          ],
                        )
                        // style: theme.textTheme.titleLarge?.copyWith(color: Colors.white) ?? TextStyle(color: Colors.white),
                      );
                      
                    }
                  
                    ),
                
              );
    
  }
}