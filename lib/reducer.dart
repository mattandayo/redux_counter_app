import 'package:redux/redux.dart';
import 'package:redux_counter_app/action.dart';
import 'package:redux_counter_app/state.dart';

CounterState counterReducer(CounterState state, IncrementAction action) =>
    CounterState(counter: state.counter + 1);

buildCombineReducers() => combineReducers<CounterState>(
    [TypedReducer<CounterState, IncrementAction>(counterReducer)]);
