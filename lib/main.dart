import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
import 'globals.dart' as globals;
import 'widgets/ogminie.dart'; // tutaj OGminiePage(), sorry, juz tak nie robie wiecej
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:go_router/go_router.dart';
import 'package:koszernapolska/screens/scaffold_with_nav_bar.dart';
import 'image_loader.dart'; // image loader to prevent abruptive loading while the bottomnavbar page is already choosen
import 'widgets/homepage.dart' as HomePage;
import 'widgets/foodpage.dart' as FoodPage;
import 'widgets/calendarpage.dart' as CalendarPage;
import 'widgets/scanerpage.dart' as ScanerPage;
import 'package:koszernapolska/screens/welcomepage.dart' as WelcomePage;
import 'package:koszernapolska/widgets/visit_us_page.dart' as VisitUsPage;
import 'package:koszernapolska/widgets/contact_page.dart' as ContactPage;
import 'package:koszernapolska/widgets/education_page.dart' as EducationPage;
import 'package:koszernapolska/widgets/community_page.dart' as CommunityPage;







void main() async{
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(KoszerApp());
}



// Router section - sekcja z routerem

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();


GoRouter router = GoRouter(
  initialLocation: '/news',
  navigatorKey: _rootNavigatorKey,
  routes: [
        GoRoute(
          path: '/',
          builder:(context, state) => WelcomePage.StartPage(),
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => ScaffoldWithNavBar(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch( // aktualnosci --- news
              routes: <RouteBase>[
                GoRoute(
                  path: '/news',
                  // parentNavigatorKey: _shellNavigatorKey,
                  builder: (context, state) => const HomePage.StartPage(),
                ),
              ]
              ),
            StatefulShellBranch( // do zjedzenia --- food section
              routes: <RouteBase>[
                GoRoute(
              path: '/food',
              // parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) => FoodPage.StartPage(),
              routes: [
                GoRoute(
                  path: 'recipes',
                  // parentNavigatorKey: _shellNavigatorKey,
                  builder: (context, state) => FoodPage.Recipes(),
                ),
                GoRoute(
                  path: 'kosherplaces',
                  builder: (context, state) => FoodPage.KosherPlaces(), 
                ),
                GoRoute(
                  path: 'kosherlist',
                  builder:(context, state) => FoodPage.KosherList(),
                  ),
                GoRoute(
                  path: 'pesachlist',
                  builder:(context, state) => FoodPage.PesachList(), 
                ),
              ]
              ),
              ]
              ),
            StatefulShellBranch( // kalendarz --- calendar section
              routes: <RouteBase>[
                GoRoute(
                  path: '/calendar',
                  // parentNavigatorKey: _shellNavigatorKey,
                  builder: (context, state) => CalendarPage.StartPage(),
              ),
              ]
              ),
            StatefulShellBranch( // skaner --- kosher scaner section
              routes: <RouteBase>[
                GoRoute(
                  path: '/scaner',
                  // parentNavigatorKey: _shellNavigatorKey,
                  builder:(context, state) => ScanerPage.StartPage(),
              )
              ]
              ),
          ]
          ),
        GoRoute( // Strona z informacja o gminie --- page with the info about community
          path: '/about',
          builder:(context, state) => OGminiePage(),
        ),
        GoRoute(
          path: '/visitus',
          builder:(context, state) => VisitUsPage.MainPage(), 
        ),
        GoRoute(
          path: '/contact',
          builder: (context, state) => ContactPage.MainPage(),
        ),
        GoRoute(
          path: '/education',
          builder: (context, state) => EducationPage.MainPage(),
          ),
        GoRoute(
          path: '/community',
          builder:(context, state) => CommunityPage.MainPage(), 
        ),
      ],
    );
  

// **** the end of the router section --- koniec sekcji router'a



// HERE IS THE MAIN APP ----- glowny program


class KoszerApp extends StatelessWidget {
  const KoszerApp({super.key});

  @override
  Widget build(BuildContext context) {    // FlutterStatusBarColor.setStatusBarColor(Color.fromARGB(255, 0, 41, 107))
    // batch preload images
    return MaterialApp.router(
      routerConfig: router, 
      theme: ThemeData(
        useMaterial3: true,
        dividerTheme: DividerThemeData(
          color: Colors.transparent,
        ),
      ),
    );
  }
}

//*** the end of the main progran --- koniec glownego programu



