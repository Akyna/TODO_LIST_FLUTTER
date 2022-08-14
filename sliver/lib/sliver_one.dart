import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:vector_math/vector_math_64.dart' as math;

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

class SliverOne extends StatefulWidget {
  const SliverOne({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  static const routeName = '/sliver-one';

  @override
  State<SliverOne> createState() => _SliverOneState();
}

class _SliverOneState extends State<SliverOne> {
  late final ScrollController _controller;

  final _key1 = GlobalKey(debugLabel: '1one1');

  final _key2 = GlobalKey(debugLabel: '2one2');
  late double _key2Offset;

  final _key3 = GlobalKey(debugLabel: '3one3');
  late double _key3Offset;

  final _key4 = GlobalKey(debugLabel: '4one4');
  late double _key4Offset;
  late List<Widget> _chl;
  final _minHeight = 60.0;
  final _maxHeight = 200.0;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    WidgetsBinding.instance?.addPostFrameCallback(_afterLayout);

    _chl = <Widget>[
      Container(color: Colors.red, height: 150.0),
      Container(color: Colors.purple, height: 150.0),
      Container(color: Colors.green, height: 150.0),
      Container(color: Colors.orange, height: 150.0),
      Container(color: Colors.yellow, height: 150.0),
      Container(color: Colors.pink, height: 150.0),
      Container(color: Colors.cyan, height: 150.0),
      Container(color: Colors.indigo, height: 150.0),
      Container(color: Colors.blue, height: 150.0),
    ];
  }

  _afterLayout(_) {
    _key2Offset = _key2.translationY;
    _key3Offset = _key3.translationY;
    _key4Offset = _key4.translationY;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            forceElevated: true,
            title: Text(widget.title),
          ),
          SliverPersistentHeader(
            pinned: true,
            key: _key1,
            delegate: _SliverAppBarDelegate(
              minHeight: _minHeight,
              maxHeight: _maxHeight,
              child: GestureDetector(
                onTap: () {
                  _controller.animateTo(
                    _controller.position.minScrollExtent,
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
            children: _chl,
            // children: [
            //   Container(color: Colors.red, height: 150.0),
            //   Container(color: Colors.purple, height: 150.0),
            //   Container(color: Colors.green, height: 150.0),
            //   Container(color: Colors.orange, height: 150.0),
            //   Container(color: Colors.yellow, height: 150.0),
            //   Container(color: Colors.pink, height: 150.0),
            //   Container(color: Colors.cyan, height: 150.0),
            //   Container(color: Colors.indigo, height: 150.0),
            //   Container(color: Colors.blue, height: 150.0),
            // ],
          ),
          SliverPersistentHeader(
            pinned: true,
            key: _key2,
            delegate: _SliverAppBarDelegate(
              minHeight: _minHeight,
              maxHeight: _maxHeight,
              child: GestureDetector(
                onTap: () {
                  _controller.animateTo(
                    _key2Offset - (_minHeight + _key1.translationY),
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
              minHeight: _minHeight,
              maxHeight: _maxHeight,
              child: GestureDetector(
                onTap: () {
                  _controller.animateTo(
                    _key3Offset - (_minHeight + _key2.translationY),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                child: Container(
                  color: Colors.orangeAccent,
                  child: const Center(
                    child: Text("Header Section 3"),
                  ),
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
              minHeight: _minHeight,
              maxHeight: _maxHeight,
              child: GestureDetector(
                onTap: () {
                  _controller.animateTo(
                    _key4Offset - (_minHeight + _key3.translationY),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                child: Container(
                  color: Colors.redAccent,
                  child: const Center(
                    child: Text("Header Section 4"),
                  ),
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
          /// VAR 01
          // Scrollable.ensureVisible(dataKey.currentContext!)

          /// VAR 02
          // BuildContext ddd = _key3.currentContext!;
          // Future.delayed(const Duration(milliseconds: 150), () {
          //   Scrollable.of(ddd)?.position.ensureVisible(
          //       ddd.findRenderObject()!,
          //       duration: const Duration(milliseconds: 200));
          // });

          /// VAR 03
          // Scroll maximum end, if you want you can give
          // hardcoded values also in place of
          // _scrollController.position.maxScrollExtent
          _controller.animateTo(
            _controller.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );

          /// TODO: for future
          // setState(() {
          //   _chl = [..._chl, Container(color: Colors.brown, height: 150.0)];
          //   WidgetsBinding.instance?.addPostFrameCallback(_afterLayout);
          // });
        },
      ),
    );
  }
}

extension GlobalKeyEx on GlobalKey {
  double get size {
    final box = currentContext!.findRenderObject();
    if (box != null) {
      return box.paintBounds.height;
    } else {
      return 0.0;
    }
  }

  double get translationY {
    final box = currentContext!.findRenderObject();
    final translation = box?.getTransformTo(null).getTranslation();
    if (box != null && translation != null) {
      return translation.y;
    } else {
      return 0.0;
    }
  }

  double get localToGlobalOffsetByY {
    final box = currentContext!.findRenderObject();
    if (box != null) {
      final Matrix4 transform = box.getTransformTo(null);
      final double det = transform.invert();
      if (det == 0.0) {
        return 0.0;
      }

      final math.Vector3 n = math.Vector3(0.0, 0.0, 1.0);
      final math.Vector3 i = transform.perspectiveTransform(math.Vector3(0.0, 0.0, 0.0));
      final math.Vector3 d = transform.perspectiveTransform(math.Vector3(0.0, 0.0, 1.0)) - i;
      var point = Offset.zero;
      final math.Vector3 s = transform.perspectiveTransform(math.Vector3(point.dx, point.dy, 0.0));
      final math.Vector3 p = s - d * (n.dot(s) / n.dot(d));
      // final dd = Offset(p.x, p.y);
      return p.y;
    } else {
      return 0.0;
    }
  }

  Map? get globalPaintBsSRC {
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
