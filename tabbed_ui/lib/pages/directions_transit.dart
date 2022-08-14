import 'package:flutter/material.dart';

class DirectionsTransit extends StatefulWidget {
  const DirectionsTransit({Key? key}) : super(key: key);

  @override
  State<DirectionsTransit> createState() => _DirectionsTransitState();
}

class _DirectionsTransitState extends State<DirectionsTransit>
    with AutomaticKeepAliveClientMixin<DirectionsTransit> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("DirectionsTransit"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text("Count $_count"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _count += 1;
              });
            },
            child: const Text("ADD"),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
