import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FlagRoundedImage extends StatelessWidget {
  const FlagRoundedImage({@required this.offsetAnimation, Key key}) : super(key: key);

  final Animation<Offset> offsetAnimation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: offsetAnimation,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.grey[900], blurRadius: 5.0, spreadRadius: 2.0)],
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: 'https://github.com/remonh87/country-flags/blob/master/png250px/za.png?raw=true',
            placeholder: (_, __) => Image.asset(
              'assets/globe.webp',
              fit: BoxFit.fill,
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
