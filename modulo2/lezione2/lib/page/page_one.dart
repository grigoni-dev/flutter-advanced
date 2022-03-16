import 'package:flutter/material.dart';
import 'package:lezione2/model/page_two_args.dart';
import 'package:lezione2/page/page_two.dart';

class PageOne extends StatelessWidget {
  static const route = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Detail Page"),
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () => gotoPage(
          context,
          PageTwo.route,
          PageTwoArgs(arg1: "Enrico", arg2: 27),
        ),
      ),
    );
  }

  gotoPage(BuildContext context, String route, PageTwoArgs args) {
    Navigator.pushNamed(context, route, arguments: args);
  }
}
