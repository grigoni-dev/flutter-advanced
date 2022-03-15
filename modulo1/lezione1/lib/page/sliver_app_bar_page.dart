import 'package:flutter/material.dart';
import 'package:lezione1/main.dart';

class SliverAppBarPage extends StatelessWidget {
  const SliverAppBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.grey.shade900,
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.edit),
              ),
            ],
            expandedHeight: 230,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Giovanni",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              background: Image(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1457449940276-e8deed18bfff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Text("Testo di prova di un elemento standard"),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Text("Elemento $index"),
              childCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}
