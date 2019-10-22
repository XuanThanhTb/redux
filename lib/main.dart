import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_demo/mainManager.dart';
import 'package:redux_demo/redux/store/store.dart' as appReduxStore;
import 'package:redux_demo/redux/store/store.dart';

void main() async {
  final store = await appReduxStore.loadStore();
  return runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> _store;
  MyApp(this._store);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Redux',
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
          backgroundColor: Colors.yellow,
        ),
        body: SendData(_store),
      ),
    );
  }
}

class SendData extends StatefulWidget {
  final Store<AppState> _store;
  SendData(this._store);
  @override
  State<StatefulWidget> createState() {
    return SendDataState(_store);
  }
}

class SendDataState extends State<SendData> {
  final Store<AppState> _store;
  SendDataState(this._store);
  final int dataNumber = 0;

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: _store,
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              StoreConnector<AppState, MainManager>(
                  converter: (store) => MainManager.shared,
                  builder: (context, counter) {
                    return Center(
                        child: Text('${counter.numberCount}',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 24)));
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                    child: Text('+'),
                    onPressed: () {
                      MainManager().addItem();
                    },
                  ),
                  RaisedButton(
                    child: Text('-'),
                    onPressed: () {
                      MainManager().removeItem();
                    },
                  )
                ],
              )
            ],
          ),
        ));
  }
}
