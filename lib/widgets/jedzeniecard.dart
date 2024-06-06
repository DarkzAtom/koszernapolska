import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
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
  final CachedNetworkImage? imagelinkweb;

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
                padding: EdgeInsets.all(8),
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: Color.fromARGB(255, 31, 31, 31), boxShadow: [BoxShadow(color: Color.fromARGB(6, 53, 53, 53).withOpacity(0.6), spreadRadius: 1, blurRadius: 5, offset: Offset(0, 3),),]),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    // height: double.infinity,
                    // width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: Color.fromARGB(255, 31, 31, 31),),
                  // color: widget.backgroundColor ?? Colors.transparent,
                  child: AspectRatio(aspectRatio: 1/1, child: Container(child: widget.imagelinkweb != null ? widget.imagelinkweb! : SizedBox.shrink() )),
                  ),
                ),
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Center(child: SizedBox(height: 25, child: FittedBox(fit: BoxFit.scaleDown,child: Text(widget.label, style: GoogleFonts.spaceGrotesk(textStyle: TextStyle(color: Color.fromARGB(255, 238, 237, 237), fontSize: (widget.fontSize != null && widget.fontSize !<= 18) ? widget.fontSize : 18)))))),
          )
        ]
      ),
    );
  }
}