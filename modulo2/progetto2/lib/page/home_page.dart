import 'package:flutter/material.dart';
import 'package:progetto2/model/photo_model.dart';
import 'package:progetto2/page/photo_detail_page.dart';

class HomePage extends StatelessWidget {
  static const root = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 30,
        toolbarHeight: 60,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "ART",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 10),
            ),
            Text(
              "Dove l'uomo tocca il cielo",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white54,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      body: GridView.builder(
        itemCount: PhotoModel.photos.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => customCard(
          context,
          index,
        ),
      ),
    );
  }

  Widget customCard(BuildContext context, int index) {
    final photo = PhotoModel.photos[index];
    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(context, PhotoDetailPage.root,
            arguments: PhotoDetailPageArgs(index: index)),
        /*
        
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PhotoDetailPage(
              index: index,
            ),
          ),
        )
        
        */
      },
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(photo.url), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                  color: Colors.black,
                  child: Text(
                    photo.title.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                  color: Colors.white,
                  child: Text(
                    photo.description,
                    style: TextStyle(color: Colors.black, fontSize: 9),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
