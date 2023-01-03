import 'package:bloc_counter/bloc/counter_event.dart';
import 'package:bloc_counter/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitialState(counter: 0)) {
    on<CounterEvent>(
      (event, emit) async {
        switch (state.runtimeType) {
          case CounterInitialState:
            emit(CounterLoadedState(counter: state.counter));
            break;
          case CounterLoadedState:
            switch (event.runtimeType) {
              case CounterIncrementEvent:
                emit(CounterLoadingState(counter: state.counter));
                await Future.delayed(const Duration(seconds: 1));
                emit(CounterLoadedState(counter: state.counter + 1));
                break;
              case CounterDecrementEvent:
                emit(CounterLoadingState(counter: state.counter));
                await Future.delayed(const Duration(seconds: 1));
                emit(CounterLoadedState(counter: state.counter - 1));
                break;
            }
            break;
        }
      },
    );
  }
}
