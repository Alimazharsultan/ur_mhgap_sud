// call repositories, authentication etc.

import 'package:flutter/material.dart';
import 'package:mhgap_urdu/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mhGAP_urdu',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomeScreen(),
    );
  }
}
