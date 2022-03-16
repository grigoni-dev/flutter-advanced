import 'package:flutter/material.dart';
import 'package:lezione2/model/profile_page_args.dart';

class ProfileDetailPage extends StatelessWidget {
  static const route = "/profile/detail";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ProfilePageArgs;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Detail Page"),
      ),
      body: Center(
        child: Text("""
          Name: ${args.name}
          Surname: ${args.surname}
          Age: ${args.age}
          Hobbies: ${args.hobbies}
          """),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () => gotoPage(context, "/settings", {}),
      ),
    );
  }

  gotoPage(BuildContext context, String route, Map<String, dynamic> args) {
    Navigator.pushNamed(context, route, arguments: args);
  }
}
