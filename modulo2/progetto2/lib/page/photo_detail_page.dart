import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:progetto2/model/photo_model.dart';

class PhotoDetailPage extends StatelessWidget {
  static const root = "/photo_detail_page";

  final PhotoDetailPageArgs args;

  const PhotoDetailPage({
    required this.args,
  });

  @override
  Widget build(BuildContext context) {
    final photo = PhotoModel.photos.elementAt(args.index);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          photo.title.toUpperCase(),
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 10),
        ),
      ),
      body: Center(
        child: ExtendedImage.network(
          photo.url,
          mode: ExtendedImageMode.gesture,
        ),
      ),
    );
  }
}

class PhotoDetailPageArgs {
  int index;
  PhotoDetailPageArgs({
    required this.index,
  });
}
