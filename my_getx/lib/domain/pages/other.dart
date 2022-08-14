import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx/domain/controllers/another_counter.dart';
import 'package:my_getx/domain/controllers/counter.dart';

class Other extends StatelessWidget {
  Other({Key? key}) : super(key: key);

  // "Попросите" Get найти и предоставить вам ваш Controller, используемый на другой странице.
  final Controller c = Get.find();
  final AnotherController ac = Get.find();

  @override
  Widget build(context) {
    // Получите доступ к обновленной переменной count
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("${c.count}")),
          Center(child: Text("${ac.count}")),
        ],
      ),
    );
  }
}
