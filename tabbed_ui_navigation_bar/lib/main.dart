import 'dart:developer';

import 'package:flutter/material.dart';

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
  int index = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleControllerEvent);
  }

  void _handleControllerEvent() {
    log("_handleControllerEvent: ${DateTime.now()}");
  }

  void _navigateToScreens(int index) {
    _tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const [
          NestedStack(),
          DirectionsTransit(),
          BikeScooter(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (int index) {
          setState(() {
            this.index = index;
          });
          _navigateToScreens(index);
        },
        items: const [
          BottomNavigationBarItem(
            label: "Car",
            icon: Icon(Icons.directions_car),
          ),
          BottomNavigationBarItem(
            label: "Transit",
            icon: Icon(Icons.directions_transit),
          ),
          BottomNavigationBarItem(
            label: "Scooter",
            icon: Icon(Icons.bike_scooter),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
