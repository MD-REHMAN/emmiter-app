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
  final Store store = Store();
  Provider({Widget child, initValue}) : super(child: child) {
    store.updateName(initValue);
  }
  @override
  bool updateShouldNotify(Widget oldWidget) {
    return false;
  }

  static Store of(BuildContext context) {
    Provider currentInstace =
        context.dependOnInheritedWidgetOfExactType<Provider>();
    return currentInstace.store;
  }
}
