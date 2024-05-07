import 'package:flutter/cupertino.dart';
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
                    imagelinkweb: 'https://static.wixstatic.com/media/a8ca8a_81db354d3eaa4516a9e32bebc08a9804~mv2.png/v1/fill/w_425,h_319,fp_0.50_0.50,q_95,enc_auto/a8ca8a_81db354d3eaa4516a9e32bebc08a9804~mv2.png',
                  ),
                ),
                
                // Koszerne miejsca --- Kosher places section
                GestureDetector(
                  onTap: () async { // add 'async' in case if needed
                    await Future.delayed(Duration(milliseconds: 200));
                    context.go('/food/recipes');
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
                    context.go('/food/recipes');
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
                    context.go('/food/recipes');
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


class Recipes extends StatefulWidget {
  const Recipes({super.key});

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Container(
            color: Color.fromARGB(255, 16, 16, 16),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  context.go('/food');
                },
                child: Text('gogoog'),
              ),
            ),
      ),]
    );
  }
}
