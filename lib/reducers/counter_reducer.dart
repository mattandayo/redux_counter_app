import 'package:redux_counter_app/actions/increment_action.dart';
import 'package:redux_counter_app/states/counter_state.dart';

CounterState counterReducer(CounterState state, IncrementAction action) =>
    CounterState(counter: state.counter + 1);
