import 'package:flutter/material.dart';
import 'package:lezione1/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliver Lesson"),
        centerTitle: false,
      ),
      body: bodySliverGrid(),
    );
  }

  Widget bodySliverList() => CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Text("Elemento $index"),
              childCount: 100,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Text("Elemento $index"),
              childCount: 30,
            ),
          ),
        ],
      );

  Widget bodySliverGrid() => CustomScrollView(
        slivers: [
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Container(color: Colors.blue),
                childCount: 9),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 2, mainAxisSpacing: 2),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(color: Colors.blue),
                  childCount: 9),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 3 / 1),
            ),
          ),
        ],
      );
}
