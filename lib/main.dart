import 'package:flutter/material.dart';
import 'package:emitter_app/models/store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(

//     );
//   }
// }
class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  String storeInitValue = 'Miles Morales';
  @override
  Widget build(BuildContext context) {
    debugPrint('MyApp build called');
    return Provider(
        initValue: storeInitValue,
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.cyan,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: Scaffold(
              appBar: AppBar(title: Text('Shopping Mart')),
              body: Center(child: DummyWrapper()),
              floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    debugPrint('setState called on MyAPP');
                    setState(() {});
                  },
                  child: Icon(Icons.add_outlined)),
            )));
  }
}

class DummyWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('DummyWrapper build called');
    return Column(
      children: <Widget>[
        Comp1(),
        Comp2(),
      ],
    );
  }
}

class Comp1 extends StatefulWidget {
  @override
  _Comp1State createState() => _Comp1State();
}

class _Comp1State extends State<Comp1> {
  String planet = 'Earth 1700';
  @override
  Widget build(BuildContext context) {
    debugPrint('Comp1 build called');
    Store store = Provider.of(context);
    store.onUpdate(() => setState(() {}));
    return Row(children: [
      Text(planet),
      FlatButton(
        color: Colors.cyan,
        textColor: Colors.white,
        padding: EdgeInsets.all(18.0),
        splashColor: Colors.blueAccent,
        onPressed: () {
          setState(() {
            planet = 'Earth 2070';
          });
        },
        child: Text('Change Planet'),
      ),
      Text(store.getName()),
      FlatButton(
        color: Colors.cyan,
        textColor: Colors.white,
        padding: EdgeInsets.all(18.0),
        splashColor: Colors.blueAccent,
        onPressed: () {
          store.updateName('Peter Parker');
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
  String planet = 'Earth 1700';
  @override
  void didUpdateWidget(Comp2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('Inside didUpdateWidget of Comp2');
  }

  Widget build(BuildContext context) {
    debugPrint('Comp2 build called');
    Store store = Provider.of(context);
    store.onUpdate(() => setState(() {}));

    return Row(children: [
      Text(planet),
      FlatButton(
        color: Colors.cyan,
        textColor: Colors.white,
        padding: EdgeInsets.all(18.0),
        splashColor: Colors.blueAccent,
        onPressed: () {
          setState(() {
            planet = 'Mars 1900';
          });
        },
        child: Text('Change Planet'),
      ),
      Text(store.getName()),
      FlatButton(
        color: Colors.cyan,
        textColor: Colors.white,
        padding: EdgeInsets.all(18.0),
        splashColor: Colors.blueAccent,
        onPressed: () {
          store.updateName('Spider Man');
        },
        child: Comp2Child('Wear Mask'),
      )
    ]);
  }
}

class Comp2Child extends StatelessWidget {
  String name;
  Comp2Child(name) {
    this.name = name;
  }
  @override
  Widget build(BuildContext context) {
    debugPrint('Comp2child build called');
    debugPrint('------------------------------------- Last child in the tree');
    return Text(name);
  }
}
