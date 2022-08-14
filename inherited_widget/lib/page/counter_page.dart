import 'package:flutter/material.dart';
import 'package:inherited_widget/widget/button_widget.dart';
import 'package:inherited_widget/widget/state_widget.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 48),
              child: buildTextField(onSubmitted: setCounter),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Update Counter',
              onClicked: () => setCounter(_controller.text),
            ),
            const SizedBox(height: 64),
            ButtonWidget(
              text: 'Increment Counter',
              onClicked: incrementCounter,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField({
    required ValueChanged<String> onSubmitted,
  }) =>
      TextField(
        controller: _controller,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        keyboardType: TextInputType.number,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: 'Counter',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.white),
          ),
          hintStyle: const TextStyle(color: Colors.white70),
        ),
      );

  void incrementCounter() {
    final provider = StateInheritedWidget.of(context);
    provider.incrementCounter();

    Navigator.pop(context);
  }

  void setCounter(String value) {
    try {
      final counter = int.tryParse(value);
      final provider = StateInheritedWidget.of(context);
      provider.setCounter(counter!);

      Navigator.pop(context);
    } catch (_) {}
  }
}
