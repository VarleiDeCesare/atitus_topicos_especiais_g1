import 'package:flutter/material.dart';

import 'TextScreen.dart';
import 'MapScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Meu App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MapScreen(),
        routes: {
          '/map': (context) => MapScreen(),
          '/text': (context) => TextScreen(),
        },
        debugShowCheckedModeBanner: false);
  }
}
