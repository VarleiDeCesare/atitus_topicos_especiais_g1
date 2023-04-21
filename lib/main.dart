import 'package:flutter/material.dart';

import 'text_screen.dart';
import 'map_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'App desafio flutter',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        home: MapScreen(),
        routes: {
          '/map': (context) => MapScreen(),
          '/text': (context) => TextScreen(),
        },
        debugShowCheckedModeBanner: false);
  }
}
