import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static const route = "/settings";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings Page"),
      ),
      body: Center(),
    );
  }
}
