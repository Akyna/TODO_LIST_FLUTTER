/// !!! DON'T TOUCH !!!

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:sliver/button.dart';

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  const _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class SliverOne extends StatelessWidget {
  SliverOne({
    Key? key,
    required this.title,
  })  : _controller = ScrollController(),
        _pageController = PageController(),
        super(key: key);

  final String title;
  static const routeName = '/sliver-one';
  final ScrollController _controller;
  final PageController _pageController;

  final _key = GlobalKey(debugLabel: 'one');
  final _key1 = GlobalKey(debugLabel: '1one1');
  final _key2 = GlobalKey(debugLabel: '2one2');
  final _key3 = GlobalKey(debugLabel: '3one3');
  final _key4 = GlobalKey(debugLabel: '4one4');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          // SliverAppBar(
          //   key: _key,
          //   pinned: true,
          //   forceElevated: true,
          //   title: Text(title),
          // ),
          SliverPersistentHeader(
            pinned: true,
            key: _key1,
            delegate: _SliverAppBarDelegate(
              minHeight: 60.0,
              maxHeight: 200.0,
              child: GestureDetector(
                onTap: () {
                  _controller.animateTo(
                    _key1.globalPai - 103,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                child: Container(
                  color: Colors.lightBlue,
                  child: const Center(
                    child: Text("Header Section 1"),
                  ),
                ),
              ),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 3,
            children: [
              Container(color: Colors.red, height: 150.0),
              Container(color: Colors.purple, height: 150.0),
              Container(color: Colors.green, height: 150.0),
              Container(color: Colors.orange, height: 150.0),
              Container(color: Colors.yellow, height: 150.0),
              Container(color: Colors.pink, height: 150.0),
              Container(color: Colors.cyan, height: 150.0),
              Container(color: Colors.indigo, height: 150.0),
              Container(color: Colors.blue, height: 150.0),
            ],
          ),
          SliverPersistentHeader(
            pinned: true,
            key: _key2,
            delegate: _SliverAppBarDelegate(
              minHeight: 60.0,
              maxHeight: 200.0,
              child: GestureDetector(
                onTap: () {
                  _controller.animateTo(
                    731 - 150 - 13,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                child: Container(
                  color: Colors.lightGreen,
                  child: const Center(
                    child: Text("Header Section 2"),
                  ),
                ),
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 150.0,
            delegate: SliverChildListDelegate(
              [
                Container(color: Colors.red),
                Container(color: Colors.purple),
                Container(color: Colors.green),
                Container(color: Colors.orange),
              ],
            ),
          ),
          SliverPersistentHeader(
            key: _key3,
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 60.0,
              maxHeight: 200.0,
              child: Container(
                color: Colors.orangeAccent,
                child: const Center(
                  child: Text("Header Section 3"),
                ),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 20,
            ),
          ),
          SliverPersistentHeader(
            key: _key4,
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 60.0,
              maxHeight: 200.0,
              child: Container(
                color: Colors.redAccent,
                child: const Center(
                  child: Text("Header Section 4"),
                ),
              ),
            ),
          ),
          // Yes, this could also be a SliverFixedExtentList. Writing
          // this way just for an example of SliverList construction.
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(color: Colors.pink, height: 150.0),
                Container(color: Colors.cyan, height: 150.0),
                Container(color: Colors.indigo, height: 150.0),
                Container(color: Colors.blue, height: 150.0),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.fast_forward),
        onPressed: () {
          // Scrollable.ensureVisible(
          //   _key2.currentContext!,
          //   alignment: -1.0,
          //   // alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
          //   duration: const Duration(milliseconds: 1300),
          // );

          // print(_key.globalPaintBounds);
          // print(_key1.globalPaintBounds);
          // print(_key2.globalPaintBounds);
          // print(_key3.globalPaintBounds);
          // print(_key4.globalPaintBounds);
          // print(_key4.globalPaintBounds?.top);
          /// Scroll maximum end, if you want you can give
          /// hardcoded values also in place of
          /// _scrollController.position.maxScrollExtent
          // _controller.animateTo(
          //   650 - 50 - 20,
          //   duration: const Duration(milliseconds: 500),
          //   curve: Curves.ease,
          // );
          _controller.animateTo(
            _key2.globalPai - 150 - 10,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );

          // BuildContext ddd = _key3.currentContext!;
          // Future.delayed(const Duration(milliseconds: 150), () {
          //   Scrollable.of(ddd)?.position.ensureVisible(
          //       ddd.findRenderObject()!,
          //       duration: const Duration(milliseconds: 200));
          // });
        },
      ),
    );
  }
}

extension GlobalKeyEx on GlobalKey {
  double get globalPai {
    final box = currentContext!.findRenderObject();
    final translation = box?.getTransformTo(null).getTranslation();
    if (box != null && translation != null) {
      // print(box.paintBounds.shift(Offset(translation.x, translation.y)));
      // print(box.paintBounds);
      // print(translation);
      // print(translation.y);
      return translation.y;
    } else {
      return 0.0;
    }
  }

  Map? get globalPaintBs {
    final box = currentContext!.findRenderObject() as RenderBox?;
    if (box != null) {
      Offset position = box.localToGlobal(Offset.zero);

      return {"x": position.dx, "y": position.dy};
    } else {
      return null;
    }
  }

  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    var translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      return renderObject?.paintBounds.shift(Offset(translation.x, translation.y));
    } else {
      return null;
    }
  }
}
