import 'package:example/bloc_sample/sample_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      home: const MyHomePage(title: 'Formz field demo bloc'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SampleBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<SampleBloc, SampleState>(
                  buildWhen: (previous, current) =>
                      previous.value != current.value,
                  builder: (context, state) {
                    return TextFormzField(
                      formzInput: state.value,
                      onChanged: (value) => context
                          .read<SampleBloc>()
                          .add(SampleEventValueUpdated(value)),
                    );
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<SampleBloc, SampleState>(
                  buildWhen: (previous, current) =>
                      previous.value != current.value,
                  builder: (context, state) {
                    return Text(
                      'bloc value: ${state.value.value}',
                      style: Theme.of(context).textTheme.titleMedium,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: const FabFetchData(),
      ),
    );
  }
}

class FabFetchData extends StatelessWidget {
  const FabFetchData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<SampleBloc>().add(
              const SampleEventValueUpdated('fetched value'),
            );
      },
      tooltip: 'Fetch value',
      child: const Icon(Icons.update),
    );
  }
}
