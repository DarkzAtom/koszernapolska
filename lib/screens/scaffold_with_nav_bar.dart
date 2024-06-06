import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'naszdrawer.dart';
import 'package:koszernapolska/screencontroller.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      endDrawer: NaszDrawer(),
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
          
          onDestinationSelected: (int index) => _onTap(context, index),
          height: 60,
          backgroundColor: const Color.fromARGB(255, 0, 64, 164), 
          indicatorColor: Color.fromARGB(233, 47, 105, 198),
          selectedIndex: navigationShell.currentIndex,
          
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
        
        
      );
    
  }


  void _onTap(BuildContext context, int index) {
    if (index == navigationShell.currentIndex) {
      switch (index) {
        case 0:
          scrollController.animateTo(0.0, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
          break;
        case 1:
          context.go('/food');
          break;
        case 2:
          context.go('/calendar');
          break;
        case 3:
          context.go('/scaner');
          break;
      }
    } else {


    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
      );
    }
  }
}