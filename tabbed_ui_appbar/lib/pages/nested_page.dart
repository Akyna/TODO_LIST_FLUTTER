import 'package:flutter/material.dart';
import 'package:tabbed_ui_appbar/pages/pages.dart';
import 'package:tabbed_ui_appbar/services/navigation_service.dart';

const routeHome = '/';
const car = '/direction-car';

class NestedStack extends StatefulWidget {
  const NestedStack({Key? key}) : super(key: key);

  @override
  State<NestedStack> createState() => _NestedStackState();
}

class _NestedStackState extends State<NestedStack> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: NavigationService.nestedNavigation,
      initialRoute: "/",
      onGenerateRoute: (settings) {
        late Widget page;
        switch (settings.name) {
          case car:
            page = const DirectionsCar();
            break;
          default:
            page = const NestedHomePage();
            break;
        }
        return MaterialPageRoute<dynamic>(
          builder: (context) {
            return page;
          },
          settings: settings,
        );
      },
    );
  }
}
