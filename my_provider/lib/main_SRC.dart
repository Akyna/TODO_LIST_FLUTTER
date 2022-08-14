import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Person with ChangeNotifier {
  Person({required this.name, required this.age});

  final String name;
  int age;

  void increaseAge() {
    age++;
    notifyListeners();
  }
}

class Job with ChangeNotifier {
  Job(
    this.person, {
    required this.career,
  });

  final Person person;
  String career;

  String get title {
    if (person.age >= 28) return 'Dr. ${person.name}, $career PhD';
    return '${person.name}, Student, $career';
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Person>(
            create: (_) => Person(name: 'Yohan', age: 25)),
        ChangeNotifierProxyProvider<Person, Job>(
          create: (BuildContext context) =>
              Job(Provider.of<Person>(context, listen: false), career: 'NOPE'),
          update: (BuildContext context, Person person, Job? job) =>
              Job(person, career: 'Vet'),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("BUID");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Class'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Hi, may name is ${context.select((Job j) => j.person.name)}',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text('Age: ${context.select((Job j) => j.person.age)}'),
              Text(context.watch<Job>().title),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Provider.of<Person>(context, listen: false).increaseAge(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
