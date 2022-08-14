import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tabbed_ui_appbar/services/custom_tab_bar_view_scroll_physics.dart';

import 'pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Android Tab',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Flutter Android Tab'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleControllerEvent);
  }

  void _handleControllerEvent() {
    log("_handleControllerEvent: ${DateTime.now()}");
    if (!_tabController.indexIsChanging && _tabController.index == 2) {
      _tabController.animateTo(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        physics: const CustomTabBarViewScrollPhysics(),
        children: const [
          NestedStack(),
          DirectionsTransit(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const AutomaticNotchedShape(
          RoundedRectangleBorder(),
          StadiumBorder(
            side: BorderSide(),
          ),
        ),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                _tabController.animateTo(0);
              },
              icon: const Icon(Icons.directions_car),
            ),
            IconButton(
              onPressed: () {
                _tabController.animateTo(
                  1,
                  duration: const Duration(seconds: 13),
                  curve: Curves.linear,
                );
              },
              icon: const Icon(Icons.directions_transit),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0.0,
        icon: const Icon(Icons.add),
        label: const Text('ADD'),
        onPressed: () {},
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
