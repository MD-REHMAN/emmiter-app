import 'dart:developer';

import 'package:flutter/material.dart';

class Store {
  List callbackStack = [];
  String name = 'Peter Parker';

  String getName() => name;

  void onUpdate(cb) {
    this.callbackStack.add(cb);
  }

  void emitUpdate() {
    for (var i = 0; i < callbackStack.length; i++) {
      callbackStack[i]();
    }
  }

  void updateName(value) {
    this.name = value;
    emitUpdate();
  }
}

class Provider extends InheritedWidget {
  Store store = Store();
  Provider({Widget child, initValue}) : super(child: child) {
    store.updateName(initValue);
  }

  @override
  bool updateShouldNotify(Provider oldWidget) {
    return store.name != oldWidget.store.name;
  }

  static Store of(BuildContext context, Function cb) {
    Provider currentInstace =
        context.dependOnInheritedWidgetOfExactType<Provider>();
    currentInstace.setCallBack(cb);
    return currentInstace.store;
  }

  void setCallBack(cb) {
    store.onUpdate(cb);
  }
}
