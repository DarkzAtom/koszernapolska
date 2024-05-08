import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
import 'package:koszernapolska/screens/scaffold_with_just_appbar.dart';

class OGminiePage extends StatefulWidget {
  const OGminiePage({super.key});

  @override
  State<OGminiePage> createState() => _OGminiePageState();
}

class _OGminiePageState extends State<OGminiePage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldwithjustAppBar(
      goBackToButton: '/news',
      title: 'O Gminie',
      child: Center(
              child: ElevatedButton(
                onPressed: () {
                  context.go('/news');
                },
                child: Text('gogoog'),
              ),
            ),
        );
      
    } 
  }
      