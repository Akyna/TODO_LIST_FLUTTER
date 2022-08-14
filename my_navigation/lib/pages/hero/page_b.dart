import 'package:flutter/material.dart';

class PageB extends StatelessWidget {
  const PageB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero child'),
      ),
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              'https://picsum.photos/250?image=9',
            ),
          ),
        ),
        // child: Hero(
        //   tag: 'imageHero',
        //   child: Center(
        //     child: Image.network(
        //       'https://picsum.photos/250?image=9',
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
