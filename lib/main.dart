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
import 'globals.dart' as globals;
import 'widgets/ogminie.dart'; 
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:go_router/go_router.dart';
import 'widgets/homepage.dart' as HomePage;
import 'widgets/foodpage.dart' as FoodPage;
import 'widgets/calendarpage.dart' as CalendarPage;
import 'widgets/scanerpage.dart' as ScanerPage;
import 'package:koszernapolska/screens/welcomepage.dart' as WelcomePage;
import 'package:koszernapolska/screens/scaffold_with_nav_bar.dart';





void main() => runApp(const KoszerApp());



// Router section - sekcja z routerem

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();


GoRouter router = GoRouter(
  initialLocation: '/news',
  navigatorKey: _rootNavigatorKey,
  routes: [
    
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
                )
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
        )
      ],
    );
  

           

// **** the end of the router section --- koniec sekcji router'a







// HERE IS THE MAIN APP ----- glowny program


class KoszerApp extends StatelessWidget {
  const KoszerApp({super.key});

  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarcolor.setStatusBarColor(Color.fromARGB(255, 0, 41, 107));
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        useMaterial3: true,
        dividerTheme: DividerThemeData(
          color: Colors.transparent
        )
        // textTheme:
        // TextTheme(bodyLarge: TextStyle(color: Colors.deepPurpleAccent),
        // ),
      ),
    );
  }
}

//*** the end of the main progran --- koniec glownego programu



