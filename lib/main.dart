import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'gotourl.dart';
import 'dart:async';
import 'globals.dart' as globals;
import 'ogminie.dart'; 
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'przepisynested.dart' as przepisynested;


void main() => runApp(const KoszerApp());



// klasa drawer (bocznego) menu -- class of the drawer menu
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
                onTap: ()  async { // add 'async' in case if needed
                  await Future.delayed(Duration(milliseconds: 200));
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OGminiePage())
                  );
                  }, // this is the example how you link the tile to the page number in the body of your program
                title: Text('O Gminie', style: TextStyle(color: const Color.fromARGB(230, 255, 255, 255 )))
              ),
              ListTile(
                onTap: ()  async { // add 'async' in case if needed
                  await Future.delayed(Duration(milliseconds: 200));
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OGminiePage())
                  );
                  }, 
                title: Text('jskaas;sad', style: TextStyle(color: const Color.fromARGB(230,255, 255, 255)))
              )
          ]
        ),
    );
  }
}
// ***koniec klasy bocznego menu --- the end of the drawer class

// KLASA KARTEK W SEKCJI Z JEDZENIEM --- class of the cards in the recipes/restaurants sections
class JedzenieCard extends StatefulWidget {
  const JedzenieCard({
    super.key,
    this.backgroundColor,
    required this.label,
    this.fontSize,
    this.imagelinkweb
    });


  final Color? backgroundColor;
  final String label;
  final double? fontSize;
  final String? imagelinkweb;

  @override
  State<JedzenieCard> createState() => _JedzenieCardState();
}

class _JedzenieCardState extends State<JedzenieCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch ,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[ 
          Expanded(
            flex: 1,
            child: AspectRatio(
              aspectRatio: 1/1,
              child: Container(
                // height: double.infinity,
                // width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: widget.backgroundColor ?? Colors.transparent,),
              // color: widget.backgroundColor ?? Colors.transparent,
              child: AspectRatio(aspectRatio: 1/1, child: Container(child: widget.imagelinkweb != null ? Image.network(widget.imagelinkweb!) : SizedBox.shrink() )),
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Center(child: SizedBox(height: 25, child: Text(widget.label, style: GoogleFonts.spaceGrotesk(textStyle: TextStyle(color: Colors.cyan, fontSize: (widget.fontSize != null && widget.fontSize !<= 18) ? widget.fontSize : 18))))),
          )
        ]
      ),
    );
  }
}
// ***koniec klasy kartek --- the end of the class with the cards

// HERE IS THE MAIN APP ----- glowny program
// MAIN APP
// MAIN APP
// MAIN APP


class KoszerApp extends StatelessWidget {
  const KoszerApp({super.key});

  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarcolor.setStatusBarColor(Color.fromARGB(255, 0, 41, 107));
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        dividerTheme: DividerThemeData(
          color: Colors.transparent
        )
        // textTheme:
        // TextTheme(bodyLarge: TextStyle(color: Colors.deepPurpleAccent),
        // ),
      ),
    home: const Navigation());
  }
}

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0;
  int testowa = 0;
  final List<String> _aktualki = ['Ghajskd', 'Shjs', 'Sdfs', 'I dont care', 'Sdsfsd', 'Sddfgdgdg','Ssdasdas'];

  void changePage(int index) {

    setState(() {
      currentPageIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color.fromARGB(255, 0, 64, 164),
        title: const Text('Koszerna Polska'),
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: NavigationBarTheme( 
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
        (Set<MaterialState> states) => states.contains(MaterialState.selected)
            ? GoogleFonts.nunitoSans(
          color: Colors.blue,
          fontWeight: FontWeight.bold)
            : GoogleFonts.nunitoSans(
          color: Color.fromARGB(245, 240, 239, 239),
          fontWeight: FontWeight.normal,

        ))),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          height: 60,
          backgroundColor: const Color.fromARGB(255, 0, 64, 164), 
          indicatorColor: Color.fromARGB(233, 47, 105, 198),
          selectedIndex: (currentPageIndex ),
          
          destinations: <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.newspaper),
              icon: Icon(Icons.newspaper_outlined, color: const Color.fromARGB(245, 240, 239, 239)), 
              label: 'Aktualności',
              ),
            NavigationDestination(
              selectedIcon: Transform.scale(child: Icon(Icons.food_bank), scale: 1.3),
              icon: Transform.scale(child: Icon(Icons.food_bank_outlined, color: const Color.fromARGB(245, 240, 239, 239)), scale: 1.3, ),
              label: 'Do zjedzenia',
                
            ),
            NavigationDestination(
              selectedIcon: Badge(child: Icon(Icons.calendar_month), isLabelVisible: false,),
              icon: Badge(child: Icon(Icons.calendar_month_outlined, color: const Color.fromARGB(245, 240, 239, 239)), isLabelVisible: false,),
              label: 'Kalendarz',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.document_scanner),
              icon: Badge(
                isLabelVisible: false,
                label: Text('2'),
                child: Icon(Icons.document_scanner_outlined, color: const Color.fromARGB(245, 240, 239, 239)),
              ),
              label: 'Skaner',
            ),
          ],
        ),
      ),
      drawer: NaszDrawer(), // the class is written in the top of the code --- klasa jest napisana na gorze kodu
      body: <Widget>[
        
  
        /// Aktualności page,  index 0
        Container(
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
            
          ),
          

        
        /// Do zjedzenia page, index 1
        Container(
          color: Color.fromARGB(255, 16, 16, 16),
          child: GridView.count(
            padding: EdgeInsets.all(8),
            crossAxisSpacing: 12,
            mainAxisSpacing: 8,
            crossAxisCount: 2,
            childAspectRatio: 0.85,
            // physics: ClampingScrollPhysics(),
            children: [ 
              
              // the default font size for the text under the item is 18 and you cant go for more but only for less ---  domyslny rozmiar liter jest 18 i nie moga panstwo wziac wiekszy rozmiar tylko zmniejszyc 
              
              
              GestureDetector( // --- SEKCJA Z PRZEPISAMI ---- recipes section
                onTap: () async { // add 'async' in case if needed
                  await Future.delayed(Duration(milliseconds: 200));
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OGminiePage())
                  );
                  },  
                child: JedzenieCard(
                  label: 'Przepisy',
                  backgroundColor: Colors.brown,
                  imagelinkweb: 'https://static.wixstatic.com/media/a8ca8a_81db354d3eaa4516a9e32bebc08a9804~mv2.png/v1/fill/w_425,h_319,fp_0.50_0.50,q_95,enc_auto/a8ca8a_81db354d3eaa4516a9e32bebc08a9804~mv2.png',
                ),
              ),
              
              // Koszerne miejsca --- Kosher places section
              GestureDetector(
                onTap: () async { // add 'async' in case if needed
                  await Future.delayed(Duration(milliseconds: 200));
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OGminiePage())
                  );
                  },  
                child: JedzenieCard(
                  label: 'Koszerne Miejsca',
                  backgroundColor: Colors.purple,
                ),
              ),
              
              // Koszerna lista --- Kosher list section
              GestureDetector(
                onTap: () async { // add 'async' in case if needed
                  await Future.delayed(Duration(milliseconds: 200));
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OGminiePage())
                  );
                  },  
                child: JedzenieCard(
                  backgroundColor: Colors.amber,
                  label: "Koszerna Lista",
                ),
              ),
              
              
              // Lista na pesach ---- Pesach (passover) list 
              GestureDetector(
                onTap: () async { // add 'async' in case if needed
                  await Future.delayed(Duration(milliseconds: 200));
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OGminiePage())
                  );
                  },  
                child: JedzenieCard(
                  backgroundColor: Colors.lime,
                  label: "Lista na Pesach",
                  
                  
                ),
              ),
                  ],
                ),
              ),
          
      

        /// Kalendarz page, index 2
        Container(
          color: Color.fromARGB(255, 16, 16, 16),
          child: ListView.builder(
            reverse: true,
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Hello',
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: theme.colorScheme.onPrimary),
                    ),
                  ),
                );
              }
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Hi!',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              );
            },
          ),
        ),


        //Skaner page, index 3
        Container(
          color: Color.fromARGB(255, 16, 16, 16),
          child: ListView.builder(
            reverse: true,
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'sosa',
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: theme.colorScheme.onPrimary),
                    ),
                  ),
                );
              }
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'muzik',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              );
            },
          ),
        ),


        
      ][currentPageIndex],
    );
  }
}
//*** the end of the main progran --- koniec glownego programu