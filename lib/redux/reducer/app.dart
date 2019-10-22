import 'package:redux_demo/redux/action/action.dart';
import 'package:redux_demo/redux/reducer/reducer.dart';
import 'package:redux_demo/redux/store/store.dart';

AppState appReducers(AppState appState, dynamic action) {
  if (action is ActionAppDemo) {
    return AppState(count: counterNumber(appState, action));
  }
  return appState;
}