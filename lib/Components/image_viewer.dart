// @dart=2.10

import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageViewScreen extends StatefulWidget {
  final String networkImage;

  ImageViewScreen({this.networkImage});
  @override
  _ImageViewScreenState createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff252525),
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: GestureDetector(
        child: Center(
          child: Hero(
              tag: 'imageHero',
              child: PhotoViewGallery.builder(
                scrollPhysics: const BouncingScrollPhysics(),
                builder: (BuildContext context, int index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider:
                        NetworkImage("$imageBaseUrl${widget.networkImage}"),
//                            initialScale: PhotoViewComputedScale.contained * 0.8,
//                            heroAttributes: HeroAttributes(tag: galleryItems[index].id),
                  );
                },
                itemCount: 1,
                loadingBuilder: (context, event) => Center(
                  child: Container(
                    width: 20.0,
                    height: 20.0,
                    child: CircularProgressIndicator(
                      value: event == null
                          ? 0
                          : event.cumulativeBytesLoaded /
                              event.expectedTotalBytes,
                    ),
                  ),
                ),
              )),
        ),
        onTap: () {},
      ),
    );
  }
}
