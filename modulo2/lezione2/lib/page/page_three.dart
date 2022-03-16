import 'package:flutter/material.dart';
import 'package:lezione2/model/page_three_args.dart';

class PageThree extends StatelessWidget {
  static const route = "/page_three";
  final PageThreeArgs args;

  PageThree({required this.args});

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
    );
  }
}
