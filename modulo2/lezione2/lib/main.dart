import 'package:flutter/material.dart';
import 'package:lezione2/page/page_one.dart';
import 'package:lezione2/page/page_three.dart';
import 'package:lezione2/page/page_two.dart';

import 'model/page_three_args.dart';
import 'model/page_two_args.dart';

void main() {
  runApp(App());
}

/*
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        HomePage.route: (context) => HomePage(),
        ProfilePage.route: (context) => ProfilePage(),
        ProfileDetailPage.route: (context) => ProfileDetailPage(),
        SettingsPage.route: (context) => SettingsPage(),
      },
    );
  }
}

*/

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: PageOne.route,
      onGenerateRoute: (settings) {
        final routes = {
          PageOne.route: (context) => PageOne(),
          PageTwo.route: (context) => PageTwo(
                args: settings.arguments as PageTwoArgs,
              ),
          PageThree.route: (context) => PageThree(
                args: settings.arguments as PageThreeArgs,
              ),
        };
        return MaterialPageRoute(
          builder: routes[settings.name]!,
        );
      },
    );
  }
}
