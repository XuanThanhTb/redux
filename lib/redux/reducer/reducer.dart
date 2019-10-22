import 'dart:developer' as prefix0;

import 'package:redux_demo/redux/action/action.dart';
import 'package:redux_demo/redux/counter.dart';
import 'package:redux_demo/redux/store/store.dart';

Counter counterNumber(AppState state, action){
  if (action is AddActionNumber) {
    var i = state.count.counter + 1;
    return Counter(i);
  }
  if(action is RemoveActionNumber){
    var i = state.count.counter - 1;
    return Counter(i);
  }
  return Counter(0);
}
