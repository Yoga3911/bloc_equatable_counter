import 'package:bloc_counter/bloc/counter_bloc.dart';
import 'package:bloc_counter/bloc/counter_event.dart';
import 'package:bloc_counter/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () =>
                  context.read<CounterBloc>().add(CounterDecrementEvent()),
              child: const Text("Kurang"),
            ),
            const SizedBox(width: 20),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterInitialState) {
                  return const Text("-");
                } else if (state is CounterLoadingState) {
                  return const CircularProgressIndicator();
                }
                return Text(state.counter.toString());
              },
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () =>
                  context.read<CounterBloc>().add(CounterIncrementEvent()),
              child: const Text("Tambah"),
            ),
          ],
        ),
      ),
    );
  }
}
