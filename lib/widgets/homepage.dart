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
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import '../globals.dart' as globals;
import 'package:koszernapolska/screencontroller.dart';
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
  final List<Map<String, dynamic>> _aktualki = [{'name': 'Ghajskd', 'desc': 'pierbyaf'}, {'name':'Shjs', 'desc': 'vtoroj nasd'}, {'name':'Sdfs', 'desc': 'tretij asdjkasd'}, {'name':'I dont care', 'desc': 'chetverty asdkasda'}, {'name':'Sdsfsd', 'desc': 'pyatyj sdhfjksdfsd'}, {'name': 'Sddfgdgdg', 'desc': 'shostyj dfhjsdfs'},{'name':'Ssdasdas', 'desc': 'sedmohj safdhsjdkfsdfsd'}];
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
  final CollectionReference collection = FirebaseFirestore.instance.collection('homepageposts');
  QuerySnapshot querySnapshot = await collection.get();
  data = querySnapshot.docs.map((doc) => doc.data()).where((item) => item != null).toList().cast<Map<String, dynamic>>();
  setState(() {});  // Call setState to trigger a rebuild of the widget with the new data
}




  @override
  Widget build(BuildContext context) {
    if (data.isEmpty){
      return Container(height: double.infinity, width: double.infinity, color: Color.fromARGB(255, 16, 16, 16), child: Align(alignment: Alignment.center, child: Padding(
        padding: const EdgeInsets.only(top: 0), // i wont remove this section, in case if i change my mind and i will want to get back to the topCenter alignment, so please dont look at this as if it's something stupid xDD
        child: SizedBox(height: 50, child: Center(child: CircularProgressIndicator())),
      )));
    }
    else{
            return  Container(
              color: Color.fromARGB(255, 16, 16, 16),
              child: ListView.builder(
                    controller: scrollController,
                    padding: EdgeInsets.only(top: 8, bottom: 8),   // **tile-identation** i could've added the const here but as far as i understood i have to declare at the very very top, it's not usable
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color.fromARGB(255, 31, 31, 31), boxShadow: [BoxShadow(color: Color.fromARGB(6, 53, 53, 53).withOpacity(0.6), spreadRadius: 1, blurRadius: 5, offset: Offset(0, 3))]),
                        margin: EdgeInsets.all(8), // **tile-indentation** and here. SO IF YOU WANT to change the margin of the tile/ indent of a tile from the sides and between each other - than change those 2 params
                        clipBehavior: Clip.hardEdge,
                        child: Column(
                          children: [
                            Container(
                              color: Color.fromARGB(255, 31, 31, 31),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Padding( // here is the title of the single item
                                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 6),
                                  child: Text(data[index]['name'], style: TextStyle(color: Colors.white, fontSize: 22))
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
                                  child: Container( // is where you put the text || description
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Color.fromARGB(255, 37, 37, 37)),
                                    padding: EdgeInsets.all(6),
                                     // Change this to your desired background color
                                    child: Text('${''*1}' + data[index]['desc'], style: TextStyle(color: const Color.fromARGB(230, 255, 255, 255)),),
                                    
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
}