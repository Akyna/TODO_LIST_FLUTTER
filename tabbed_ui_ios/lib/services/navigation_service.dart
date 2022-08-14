import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> _firstTabNavKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _secondTabNavKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _thirdTabNavKey =
      GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get firstTabNavKey => _firstTabNavKey;

  static GlobalKey<NavigatorState> get secondTabNavKey => _secondTabNavKey;

  static GlobalKey<NavigatorState> get thirdTabNavKey => _thirdTabNavKey;
}
