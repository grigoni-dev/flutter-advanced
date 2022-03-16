import 'package:flutter/material.dart';
import 'package:lezione2/model/page_three_args.dart';
import 'package:lezione2/model/page_two_args.dart';
import 'package:lezione2/page/page_three.dart';

class PageTwo extends StatelessWidget {
  static const route = "/page_two";
  final PageTwoArgs args;

  PageTwo({required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Detail Page"),
      ),
      body: Center(
        child: Text("""
          Arg1: ${args.arg1}
          Arg2: ${args.arg2}
          """),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () => gotoPage(context, PageThree.route,
            PageThreeArgs(arg1: "Giovanni", arg2: 30)),
      ),
    );
  }

  gotoPage(BuildContext context, String route, PageThreeArgs args) {
    Navigator.pushNamed(context, route, arguments: args);
  }
}
