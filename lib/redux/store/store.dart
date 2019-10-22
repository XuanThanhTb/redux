import 'dart:developer' as prefix0;

import 'package:redux/redux.dart';
import 'package:redux_demo/redux/counter.dart';
import 'package:redux_demo/redux/reducer/app.dart';

class AppState {
  Counter count;
  AppState({this.count});
}

Store<AppState> _store;

Store<AppState> getStore() {
  return _store;
}

Future<Store<AppState>> loadStore() async {
  AppState initialState = AppState(count: Counter(0));
  _store = new Store<AppState>(
    appReducers,
    initialState: initialState ?? AppState(),
  );
  return _store;
}
