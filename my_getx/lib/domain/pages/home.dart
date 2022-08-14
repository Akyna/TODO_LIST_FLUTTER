import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx/domain/controllers/another_counter.dart';
import 'package:my_getx/domain/controllers/counter.dart';
import 'package:my_getx/domain/pages/other.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    // Создайте экземпляр вашего класса с помощью Get.put(), чтобы сделать его доступным для всех "дочерних" маршрутов.
    final Controller c = Get.put(Controller());
    final AnotherController ac = Get.put(AnotherController());

    return Scaffold(
      // Используйте Obx(()=> чтобы обновить Text() как только count изменится.
      appBar: AppBar(
        title: Obx(
          () => Text("Кликов: ${c.count}"),
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<AnotherController>(
            builder: (newController) => Text(
              'With GetBuilder: ${newController.count.toString()}',
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text("Перейти к Other"),
              // Замените 8 строк Navigator.push простым Get.to(). Вам не нужен context!
              onPressed: () => Get.to(
                () => Other(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          c.increment();
          ac.increment();
        },
      ),
    );
  }
}
