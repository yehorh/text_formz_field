import 'package:example/shared/field.dart';
import 'package:flutter/material.dart';
import 'package:text_formz_field/text_formz_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formz field demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Formz field demo stateful widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _sample = const Field.pure();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: TextFormzField(
          formzInput: _sample,
          onChanged: onEditText,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchData,
        tooltip: 'Fetch value',
        child: const Icon(Icons.update),
      ),
    );
  }

  Future<void> fetchData() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _sample = const Field.dirty('fetched value');
    });
  }

  void onEditText(value) {
    setState(() {
      _sample = Field.dirty(value);
    });
  }
}


