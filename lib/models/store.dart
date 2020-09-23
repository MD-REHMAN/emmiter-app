import 'dart:developer';

import 'package:flutter/material.dart';

class Store extends ChangeNotifier {
  static String name = 'Peter Parker';
  String getName() => name;
  static void setReloader(cb) {
    instanceCallbackStack.add(cb);
  }

  // static instanceStack = []
  static List instanceCallbackStack = [];
  Store(cb) {
    instanceCallbackStack.add(cb);
  }

  static void updateName(value) {
    Store.name = value;
    // cb();
    // instanceCallbackStack.add(cb);

    for (var i=0; i<instanceCallbackStack.length; i++) {
      instanceCallbackStack[i]();
    }

    // instanceCallbackStack[0]();
    // instanceCallbackStack.map((e) => e());
  }
}
