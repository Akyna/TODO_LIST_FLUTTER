import 'package:flutter/material.dart';
import 'package:my_navigation/pages/hero/page_b.dart';

class PageA extends StatelessWidget {
  const PageA({Key? key}) : super(key: key);

  static const routeName = '/hero';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero parent'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const PageB(),
            ),
          );
        },
        child: Hero(
          tag: 'imageHero',
          // child: Image.network(
          //   'https://picsum.photos/250?image=9',
          // ),
          child: Center(
            child: Image.network(
              'https://picsum.photos/250?image=9',
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// усе красиво есдИть ))
// зламав флатеру голову ))
