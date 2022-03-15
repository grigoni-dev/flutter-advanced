import 'package:flutter/material.dart';
import 'package:progetto1/model/sliver_show_display_model.dart';
import 'package:progetto1/model/sliver_show_model.dart';
import 'package:progetto1/model/sliver_show_section_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          header(),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 8),
              width: double.infinity,
              color: Colors.white10,
              height: 50,
              child: Text(
                "I titoli del momento",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ...shows(), //utilizzo lo spread operator per andare ad esplodere la lista
          footer(),
        ],
      ),
    );
  }

  Widget header() => SliverAppBar(
        backgroundColor: Colors.black,
        expandedHeight: 160,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          background: Image(
            image: AssetImage("assets/images/banner.webp"),
            fit: BoxFit.cover,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Image(
            image: NetworkImage(
                "https://cdn.icon-icons.com/icons2/2699/PNG/512/netflix_logo_icon_170919.png"),
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.cast,
              ),
            ),
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
              ),
            ),
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.filter,
              ),
            ),
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: Image(
                  width: 25,
                  height: 25,
                  image: NetworkImage(
                      "https://occ-0-5494-784.1.nflxso.net/dnm/api/v6/K6hjPJd6cR6FpVELC5Pd6ovHRSk/AAAABfSpeikItdLjBivRyhWFzmP0pOvaT_V5utqbKOMrvuYq0LtkulzvnGzCzMFYkkRqpm9PlRwWocGoRI_MABHzDSKxbHSm.png?r=318"),
                ),
              ),
            ),
          ),
        ],
      );

  List<Widget> shows() => SliverShowSectionModel.sliverShows.map(
        (sliverShow) {
          if (sliverShow.displayMode == SliverShowDisplayMode.list) {
            return SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                var elem = sliverShow.shows[index];
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3), BlendMode.darken),
                      image: AssetImage(
                          elem.backgroundImage ?? "assets/images/friends.webp"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  margin: EdgeInsets.only(bottom: 5),
                  padding: EdgeInsets.all(8.0),
                  width: double.infinity,
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        elem.label,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        elem.description ?? "",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white54,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                );
              }, childCount: sliverShow.shows.length),
            );
          } else {
            return SliverGrid(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                        margin: EdgeInsets.only(bottom: 5),
                        color: Colors.white10,
                        child: Center(
                          child: Text(
                            sliverShow.shows[index].label,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  childCount: sliverShow.shows.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 5, crossAxisSpacing: 5),
            );
          }
        },
      ).toList();

  Widget footer() => SliverPadding(
        padding: EdgeInsets.only(bottom: 10),
        sliver: SliverToBoxAdapter(
          child: Center(
            child: Text("Tutti i copyright a Netflix"),
          ),
        ),
      );
}
