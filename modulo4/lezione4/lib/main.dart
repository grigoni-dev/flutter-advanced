import 'package:flutter/material.dart';
import 'package:lezione4/home_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      darkTheme: ThemeData.dark(),
    );
  }
}
