import 'package:flutter/material.dart';
import 'package:progetto2/page/photo_detail_page.dart';

import 'page/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        darkTheme: ThemeData.dark(),
        initialRoute: HomePage.root,
        onGenerateRoute: (settings) {
          final routes = {
            HomePage.root: (_) => HomePage(),
            PhotoDetailPage.root: (_) => PhotoDetailPage(
                  args: settings.arguments as PhotoDetailPageArgs,
                ),
          };
          return MaterialPageRoute(builder: routes[settings.name]!);
        });
  }
}
