import 'package:flutter/material.dart';

import 'coming_soon_page.dart';
import 'download_page.dart';
import 'home_page.dart';
import 'search_page.dart';

class RootPage extends StatefulWidget {
  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: body(),
      bottomNavigationBar: footer(),
    );
  }

  Widget body() => IndexedStack(
        children: [HomePage(), SearchPage(), ComingSoonPage(), DownloadPage()],
        index: activeTab,
      );

  Widget footer() => BottomNavigationBar(
        selectedItemColor: Colors.white,
        elevation: 5,
        currentIndex: activeTab,
        onTap: onBottomNavigationItemTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Cerca",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.queue_play_next),
            label: "Prossimamente",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_rounded),
            label: "Download",
          ),
        ],
      );

  onBottomNavigationItemTap(int index) {
    setState(() {
      activeTab = index;
    });
  }
}
