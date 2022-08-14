import 'package:flutter/material.dart';

class NavigationService {
  const NavigationService._();

  static final _navigatorKey = GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get nestedNavigation => _navigatorKey;
}
