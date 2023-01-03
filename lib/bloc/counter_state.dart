import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int counter;

  const CounterState({required this.counter});

  @override
  List<Object> get props => [counter];
}

class CounterInitialState extends CounterState {
  const CounterInitialState({required super.counter});
}

class CounterLoadingState extends CounterState {
  const CounterLoadingState({required super.counter});
}

class CounterLoadedState extends CounterState {
  const CounterLoadedState({required super.counter});
}
