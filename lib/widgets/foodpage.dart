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
import 'package:koszernapolska/recipes/exporttexts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


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
                    backgroundColor: Color.fromARGB(255, 31, 31, 31),
                    imageLink: 'lib/foodpageInitialPictures/przepisy.webp',
                    isAssetImage: true, 
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
                    imageLink: 'lib/foodpageInitialPictures/koszerneMiejsca.png',
                    isAssetImage: true,
                    // backgroundColor: Color.fromARGB(255, 31, 31, 31),
                  ),
                ),
                
                // Koszerna lista --- Kosher list section
                GestureDetector(
                  onTap: () async { // add 'async' in case if needed
                    await Future.delayed(Duration(milliseconds: 200));
                    context.go('/food/kosherlist');
                    },  
                  child: JedzenieCard(
                    // backgroundColor: Colors.amber,
                    label: "Koszerna Lista",
                    imageLink: 'lib/foodpageInitialPictures/koszernaLista.jpg',
                    isAssetImage: true,
                  ),
                ),
                
                
                // Lista na pesach ---- Pesach (passover) list 
                GestureDetector(
                  onTap: () async { // add 'async' in case if needed
                    await Future.delayed(Duration(milliseconds: 200));
                    context.go('/food/pesachlist');
                    },  
                  child: JedzenieCard(
                    // backgroundColor: Colors.lime,
                    label: "Lista na Pesach",
                    imageLink: 'lib/foodpageInitialPictures/listaNaPesach.jpg',
                    isAssetImage: true,
                    
                  ),
                ),
                    ],
                  ),
                );
  }
}

// Recipes section - sekcja z przepisami

List<Map<String, dynamic>> dataRecipes = [];
class Recipes extends StatefulWidget {
  const Recipes({super.key});

  @override
  State<Recipes> createState() => _RecipesState();
}


class _RecipesState extends State<Recipes> 


{

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
  final CollectionReference collection = FirebaseFirestore.instance.collection('foodpageposts/recipes/items');
  QuerySnapshot querySnapshot = await collection.get();
  dataRecipes = querySnapshot.docs.map((doc) => doc.data()).where((item) => item != null).toList().cast<Map<String, dynamic>>();
  setState(() {});  // Call setState to trigger a rebuild of the widget with the new data
}




  @override
  Widget build(BuildContext context) {
    if (dataRecipes.isEmpty){
      return Container(height: double.infinity, width: double.infinity, color: Color.fromARGB(255, 16, 16, 16), child: Align(alignment: Alignment.center, child: Padding(
        padding: const EdgeInsets.only(top: 0), // i wont remove this section, in case if i change my mind and i will want to get back to the topCenter alignment, so please dont look at this as if it's something stupid xDD
        child: SizedBox(height: 50, child: Center(child: CircularProgressIndicator())),
      )));
    }
    else {
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
        itemCount: dataRecipes.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () async {
              await Future.delayed(Duration(microseconds: 200));
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => RecipesPageBuilder(index: index))
              );
            },
            child: JedzenieCard(
              label: dataRecipes[index]['name'], 
              fontSize: 15, 
              imageLink: dataRecipes[index]['link'],
            ),
          );
        }
      )
    );
  }
}}


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
        child: Column(
          children: [
            Container(padding: EdgeInsets.all(12),child: Text(dataRecipes[index]['name'], style: TextStyle(color: Colors.white, fontSize: 24))),
            Container(child: ImageLoader(dataRecipes[index]['link']),),
            Container(
              padding: EdgeInsets.all(12),
              child:  Text(dataRecipes[index]['desc'], style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
        ),
      );
  }
}

// ***the end of the recipes section --- koniec sekcji z przepisami



// Kosher Places section --- sekcja z koszernymi miejscami
List<Map<String, dynamic>> dataKosherPlaces = [];
class KosherPlaces extends StatefulWidget {
  const KosherPlaces({super.key});

  @override
  State<KosherPlaces> createState() => _KosherPlacesState();
}



class _KosherPlacesState extends State<KosherPlaces> {

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
  final CollectionReference collection = FirebaseFirestore.instance.collection('foodpageposts/kosherPlaces/Warszawa');
  QuerySnapshot querySnapshot = await collection.get();
  dataKosherPlaces = querySnapshot.docs.map((doc) => doc.data()).where((item) => item != null).toList().cast<Map<String, dynamic>>();
  setState(() {});  // Call setState to trigger a rebuild of the widget with the new data
}


  @override
  Widget build(BuildContext context) {
    if (dataKosherPlaces.isEmpty){
      return Container(height: double.infinity, width: double.infinity, color: Color.fromARGB(255, 16, 16, 16), child: Align(alignment: Alignment.center, child: Padding(
        padding: const EdgeInsets.only(top: 0), // i wont remove this section, in case if i change my mind and i will want to get back to the topCenter alignment, so please dont look at this as if it's something stupid xDD
        child: SizedBox(height: 50, child: Center(child: CircularProgressIndicator())),
      )));
    }
    else {
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
        itemCount: dataKosherPlaces.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () async {
              await Future.delayed(Duration(microseconds: 200));
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => KosherPlacesPageBuilder(index: index))
              );
            },
            child: JedzenieCard(
              label: dataKosherPlaces[index]['name'], 
              fontSize: 15, 
              imageLink: dataKosherPlaces[index]['imageLink'],
            ),
          );
        }
      )
    );
  }
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
          child:  Center(child: Text(dataKosherPlaces[index]['desc'], style: TextStyle(color: Colors.white))),
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
          child:  Center(child: Text(dataRecipes[index]['desc'], style: TextStyle(color: Colors.white))),
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
          child:  Center(child: Text(dataRecipes[index]['desc'], style: TextStyle(color: Colors.white))),
        ),
        ),
      );
  }
}



// final List<Map<String, dynamic>> _azaza = [
//   {'name': 'Kugel Jerozolimski', 'desc': kugeljerozolimski, 'link': 'https://static.wixstatic.com/media/a8ca8a_0b581b7af2d9488089e9950df8623555~mv2.jpg/v1/fill/w_284,h_284,fp_0.50_0.50,q_90,enc_auto/a8ca8a_0b581b7af2d9488089e9950df8623555~mv2.jpg'}, 
//   {'name':'Śledź po wileńsku', 'desc': sledzpowilensku, 'link': 'https://static.wixstatic.com/media/a8ca8a_ad134cbc588d42c395276557ff50fff9~mv2.png/v1/fill/w_237,h_258,fp_0.50_0.50,q_95,enc_auto/a8ca8a_ad134cbc588d42c395276557ff50fff9~mv2.png'}, 
//   {'name': "Ma'amoul", 'desc': maamoul, 'link': 'https://static.wixstatic.com/media/a8ca8a_81db354d3eaa4516a9e32bebc08a9804~mv2.png/v1/fill/w_236,h_177,fp_0.50_0.50,q_95,enc_auto/a8ca8a_81db354d3eaa4516a9e32bebc08a9804~mv2.png'}, 
//   {'name':'Pieczone owoce', 'desc': pieczoneowoce, 'link': 'https://static.wixstatic.com/media/a8ca8a_8ce0e0e4c5e0483baa0c3ea5be7a54e8~mv2.jpg/v1/fill/w_237,h_133,fp_0.50_0.50,q_90,enc_auto/a8ca8a_8ce0e0e4c5e0483baa0c3ea5be7a54e8~mv2.jpg'}, 
//   {'name':'Szakszuka', 'desc': szakszuka, 'link': 'https://static.wixstatic.com/media/a8ca8a_9a39e7c5cf844afa9036687e42cfe30f~mv2.png/v1/fill/w_237,h_178,fp_0.50_0.50,q_95,enc_auto/a8ca8a_9a39e7c5cf844afa9036687e42cfe30f~mv2.png'}, 
//   {'name':'Buraki Noama', 'desc': burakiNoama, 'link': 'https://static.wixstatic.com/media/a8ca8a_c91188e37a58480d9327e15fdc289243~mv2.png/v1/fill/w_236,h_356,fp_0.50_0.50,q_95,enc_auto/a8ca8a_c91188e37a58480d9327e15fdc289243~mv2.png'},
//   {'name':'Humus to Mus', 'desc': humusToMus, 'link': 'https://static.wixstatic.com/media/a8ca8a_35a09378dbfb45c9a2de71591e71a7ae~mv2.png/v1/fill/w_237,h_536,fp_0.50_0.50,q_95,enc_auto/a8ca8a_35a09378dbfb45c9a2de71591e71a7ae~mv2.png'},
//   {'name':'Zimowy Kuskus', 'desc': zimowyKuskus, 'link': 'https://static.wixstatic.com/media/a8ca8a_a54ca850079640dc932145ad36a39339~mv2.png/v1/fill/w_237,h_133,fp_0.50_0.50,q_95,enc_auto/a8ca8a_a54ca850079640dc932145ad36a39339~mv2.png'},
//   {'name':'Klasyczne Latkes', 'desc': klasyczneLatkes, 'link': 'https://static.wixstatic.com/media/a8ca8a_6918a6c79f954022b670ccb260c4c969~mv2.png/v1/fill/w_236,h_133,fp_0.50_0.50,q_95,enc_auto/a8ca8a_6918a6c79f954022b670ccb260c4c969~mv2.png'},
//   {'name':'Sufganiyot', 'desc': sufganiyot, 'link': 'https://static.wixstatic.com/media/a8ca8a_f01391a3effc4ac594285337d4384270~mv2.jpg/v1/fill/w_356,h_200,fp_0.50_0.50,q_90,enc_auto/a8ca8a_f01391a3effc4ac594285337d4384270~mv2.jpg'},
//   ];
