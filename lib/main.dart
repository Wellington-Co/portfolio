import 'package:flutter/material.dart';
import 'screens/home.dart'; // Home Screen
import 'screens/about.dart'; // About Screen
import 'screens/skills.dart'; // Skills Screen (Example)
import 'screens/projects.dart'; // Projects Screen (Example)
import 'screens/contact.dart'; // Contact Screen (Example)
import 'package:wellingtone/screens/contact.dart';


void main() {
  runApp(MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wellingtone Otieno',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/', // Default route is home screen
      routes: {
        '/': (context) => HomeScreen(), // Home screen route
        '/about': (context) => AboutScreen(), // About screen route
        '/skills': (context) => SkillsScreen(), // Skills screen route (add your Skills screen)
        '/projects': (context) => ProjectsScreen(), // Projects screen route (add your Projects screen)
        '/contact': (context) => ContactScreen(), // Contact screen route (add your Contact screen)
      },
    );
  }
}
