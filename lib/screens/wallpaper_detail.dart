import 'package:flutter/material.dart';

class WallpaperDetailsPage extends StatelessWidget {
  const WallpaperDetailsPage({super.key,required this.wallUrl});

  final String wallUrl;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: Duration(seconds: 2),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.network(wallUrl,fit: BoxFit.cover,)),
      ),
    );
  }
}