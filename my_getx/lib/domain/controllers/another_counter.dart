import 'package:get/get.dart';

class AnotherController extends GetxController {
  int count = 10;

  increment() {
    count++;
    update();
  }
}
