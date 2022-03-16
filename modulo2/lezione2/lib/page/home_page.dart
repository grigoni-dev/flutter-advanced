import 'package:flutter/material.dart';
import 'package:lezione2/page/profile_page.dart';

class HomePage extends StatelessWidget {
  static const route = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () => gotoPage(
          context,
          ProfilePage.route,
          {
            "name": "Giovanni",
            "surname": "Rigoni",
            "age": 30,
            "hobbies": ["football", "bike", "guitar"],
          },
        ),
      ),
    );
  }

  gotoPage(BuildContext context, String route, Map<String, dynamic> args) {
    Navigator.pushNamed(context, route, arguments: args);
  }
}
