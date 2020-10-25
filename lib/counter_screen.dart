import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_counter_app/action.dart';
import 'package:redux_counter_app/state.dart';

class CounterScreen extends StatelessWidget {
  final Store<CounterState> store;
  final String title;
  CounterScreen({Key key, this.store, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreProvider(
        store: store,
        child: MaterialApp(
          theme: ThemeData.dark(),
          title: title,
          home: Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StoreConnector<int, String>(
                    converter: (store) => store.state.toString(),
                    builder: (context, count) => Text(
                      count,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  )
                ],
              ),
            ),
            floatingActionButton: StoreConnector<int, VoidCallback>(
              converter: (store) {
                return () => store.dispatch(IncrementAction);
              },
              builder: (context, callback) {
                return FloatingActionButton(
                  onPressed: callback,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                );
              },
            ),
          ),
        ),
      );
}
