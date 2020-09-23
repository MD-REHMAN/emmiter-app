import 'package:flutter/material.dart';
import 'package:emitter_app/models/store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(title: Text('Shopping Mart')),
          body: Center(
            child: Row(
              children: <Widget>[Comp1(), Text('                  '), Comp2()],
            ),
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Store.updateName("Who's that?");
              },
              child: Icon(Icons.add_outlined)),
        ));
  }
}

class Comp1 extends StatefulWidget {
  @override
  _Comp1State createState() => _Comp1State();
}

class _Comp1State extends State<Comp1> {
  // static rerender() => setState(() {});
  // Store store = Store();
  @override
  Widget build(BuildContext context) {
    Store store = Store(() => setState(() {}));
    // Store.setReloader(() => setState(() {}));
    return Row(children: [
      Text(store.getName()),
      FlatButton(
        color: Colors.cyan,
        textColor: Colors.white,
        padding: EdgeInsets.all(18.0),
        splashColor: Colors.blueAccent,
        onPressed: () {
          Store.updateName('Peter Parker');
        },
        child: Text('Remove Mask'),
      )
    ]);
  }
}

class Comp2 extends StatefulWidget {
  @override
  _Comp2State createState() => _Comp2State();
}

class _Comp2State extends State<Comp2> {
  @override
  Widget build(BuildContext context) {
    Store store = Store(() => setState(() {}));
    return Row(children: [
      Text(store.getName()),
      FlatButton(
        color: Colors.cyan,
        textColor: Colors.white,
        padding: EdgeInsets.all(18.0),
        splashColor: Colors.blueAccent,
        onPressed: () {
          Store.updateName('Spider Man');
          // _Comp1State.setState();
          // setState(() {});
        },
        child: Text('Wear Mask'),
      )
    ]);
  }
}
