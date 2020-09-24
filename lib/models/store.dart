import 'dart:developer';

import 'package:flutter/material.dart';

class Store {
  List callbackStack = [];

  String name = 'Peter Parker';
  String getName() => name;

  // static void onUpdate(cb) {
  //   callbackStack.add(cb);
  // }

  void updateName(value) {
    log('value - ' + value);
    this.name = value;
    for (var i = 0; i < callbackStack.length; i++) {
      callbackStack[i]();
    }
  }
}

class Provider extends InheritedWidget {
  static Store _store = Store();
  Provider({Widget child, Store store}) : super(child: child);

  @override
  bool updateShouldNotify(Provider oldWidget) {
    return false;
  }

  // static Provider of(BuildContext context, cb) {
  //   Store.callbackStack.add(cb);
  //   return context.inheritFromWidgetOfExactType(Provider);
  // }
  static Store getStore(cb) {
    _store.callbackStack.add(cb);
    return _store;
  }
}

// class Store extends ChangeNotifier {
//   String name = 'Peter Parker';
//   String getName() => name;
//   static void setReloader(cb) {
//     instanceCallbackStack.add(cb);
//   }

//   static List instanceCallbackStack = [];
//   Store(cb) {
//     instanceCallbackStack.add(cb);
//   }

//   void updateName(value) {
//     this.name = value;
//     for (var i=0; i<instanceCallbackStack.length; i++) {
//       instanceCallbackStack[i]();
//     }
//   }
// }
