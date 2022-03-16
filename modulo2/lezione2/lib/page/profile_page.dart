import 'package:flutter/material.dart';
import 'package:lezione2/model/profile_page_args.dart';
import 'package:lezione2/page/profile_detail_page.dart';

class ProfilePage extends StatelessWidget {
  static const route = "/profile";

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      body: Center(
        child: Text("""
          Name: ${args["name"]}
          Surname: ${args["surname"]}
          Age: ${args["age"]}
          Hobbies: ${args["hobbies"]}
          """),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () => gotoPage(
          context,
          ProfileDetailPage.route,
          ProfilePageArgs(
            name: "Giovanni",
            surname: "Rigoni",
            age: 30,
            hobbies: ["football", "bike", "guitar"],
          ),
        ),
      ),
    );
  }

  gotoPage(BuildContext context, String route, ProfilePageArgs args) {
    Navigator.pushNamed(context, route, arguments: args);
  }
}
