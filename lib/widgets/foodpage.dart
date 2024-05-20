import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:koszernapolska/screens/scaffold_with_just_appbar.dart';
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
import 'jedzeniecard.dart';
import 'package:koszernapolska/image_loader.dart';


/// !!!
/// 
/// childAspectRatio: --- (optimal sizes for making a card look like a square)
/// --- 0,85 is optimal for a 2 in a row, o,8 is for  3 in a row


class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    context.go('/food/recipes');
                    
                    
                    },  
                  child: JedzenieCard(
                    label: 'Przepisy',
                    backgroundColor: Colors.brown,
                    imagelinkweb: ImageLoader("https://static.wixstatic.com/media/a8ca8a_0b581b7af2d9488089e9950df8623555~mv2.jpg/v1/fill/w_284,h_284,fp_0.50_0.50,q_90,enc_auto/a8ca8a_0b581b7af2d9488089e9950df8623555~mv2.jpg"), 
                  ),
                ),
                
                // Koszerne miejsca --- Kosher places section
                GestureDetector(
                  onTap: () async { // add 'async' in case if needed
                    await Future.delayed(Duration(milliseconds: 200));
                    context.go('/food/kosherplaces');
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
                    context.go('/food/kosherlist');
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
                    context.go('/food/pesachlist');
                    },  
                  child: JedzenieCard(
                    backgroundColor: Colors.lime,
                    label: "Lista na Pesach",
                    
                    
                  ),
                ),
                    ],
                  ),
                );
  }
}

// Recipes section - sekcja z przepisami

class Recipes extends StatefulWidget {
  const Recipes({super.key});

  @override
  State<Recipes> createState() => _RecipesState();
}

final List<Map<String, dynamic>> _azaza = [{'name': 'sdsa', 'desc': 'thefirstafasd' }, {'name':'asdasdas', 'desc': 'say hi to the new world'}, {'name':'vsdbfsdbfjsd', 'desc': 'im not losloslo'}, {'name':'fgshdbfnksldsfdsdfsdf', 'desc': 'sfdsldfsd'}, {'name':'skgsodlsdsd', 'desc': 'sbhnjmk'}, {'name':'sgfjsk', 'desc':'sfskdfsd'}];

class _RecipesState extends State<Recipes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 16, 16, 16),
      child: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 12, 
          mainAxisSpacing: 8, 
          crossAxisCount: 3, 
          childAspectRatio: 0.8,
          
        ), 
        itemCount: _azaza.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () async {
              await Future.delayed(Duration(microseconds: 200));
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => RecipesPageBuilder(index: index))
              );
            },
            child: JedzenieCard(
              label: _azaza[index]['name'], 
              fontSize: 15, 
              backgroundColor: Colors.green,
            ),
          );
        }
      )
    );
  }
}


class RecipesPageBuilder extends StatelessWidget {
  const RecipesPageBuilder({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 16, 16, 16),
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Container(
          child:  Center(child: Text(_azaza[index]['desc'], style: TextStyle(color: Colors.white))),
        ),
        ),
      );
  }
}

// ***the end of the recipes section --- koniec sekcji z przepisami



// Kosher Places section --- sekcja z koszernymi miejscami

class KosherPlaces extends StatefulWidget {
  const KosherPlaces({super.key});

  @override
  State<KosherPlaces> createState() => _KosherPlacesState();
}

int index_temp_kosherplaces = 1;

class _KosherPlacesState extends State<KosherPlaces> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => KosherPlacesPageBuilder(index: index_temp_kosherplaces)));
        }, 
        child: Text('press me', style: TextStyle(color: Colors.black),),

      ),
    );
  }
}


class KosherPlacesPageBuilder extends StatelessWidget {
  const KosherPlacesPageBuilder({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color.fromARGB(255, 16, 16, 16),
      color: Color.fromARGB(255, 109, 63, 63), // temp in order to distinguish
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Container(
          child:  Center(child: Text(_azaza[index]['desc'], style: TextStyle(color: Colors.white))),
        ),
        ),
      );
  }
}

// the end of the kosher places section --- koniec sekcjii z koszernymi miejscami 



// the list of kosher products section --- sekcja z koszernymi produktami

class KosherList extends StatefulWidget {
  const KosherList({super.key});

  @override
  State<KosherList> createState() => _KosherListState();
}

int index_temp_kosherlist = 1;

class _KosherListState extends State<KosherList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 34, 117, 176),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => KosherListPageBuilder(index: index_temp_kosherlist)));
        }, 
        child: Text('press me', style: TextStyle(color: Colors.black),),

      ),
    );
  }
}


class KosherListPageBuilder extends StatelessWidget {
  const KosherListPageBuilder({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color.fromARGB(255, 16, 16, 16),
      color: Color.fromARGB(255, 72, 3, 3), // temp in order to distinguish
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Container(
          child:  Center(child: Text(_azaza[index]['desc'], style: TextStyle(color: Colors.white))),
        ),
        ),
      );
  }
}


// the end of the kosher list section --- koniec sekcjii listy koszernej


// Pesach list section --- sekcja z lista na pesach


class PesachList extends StatefulWidget {
  const PesachList({super.key});

  @override
  State<PesachList> createState() => _PesachListState();
}

int index_temp_PesachList = 1;

class _PesachListState extends State<PesachList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 28, 183, 74),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => PesachListPageBuilder(index: index_temp_PesachList)));
        }, 
        child: Text('press me', style: TextStyle(color: Colors.black),),

      ),
    );
  }
}


class PesachListPageBuilder extends StatelessWidget {
  const PesachListPageBuilder({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color.fromARGB(255, 16, 16, 16),
      color: Color.fromARGB(255, 220, 9, 202), // temp in order to distinguish
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Container(
          child:  Center(child: Text(_azaza[index]['desc'], style: TextStyle(color: Colors.white))),
        ),
        ),
      );
  }
}