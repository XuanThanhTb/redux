import 'package:redux/redux.dart';
import 'package:redux_demo/redux/action/action.dart';
import 'package:redux_demo/redux/counter.dart';
import 'package:redux_demo/redux/store/store.dart';
import 'package:redux_demo/redux/store/store.dart' as appReduxStore;

class MainManager {
  static final MainManager shared = MainManager._internal();

  Store<AppState> _store = appReduxStore.getStore();

  factory MainManager() => shared;

  MainManager._internal();
  int get numberCount => _store.state.count.counter;
  addItem() {
    _store.dispatch(AddActionNumber());
  }
  removeItem(){
    _store.dispatch(RemoveActionNumber());
  }
}
