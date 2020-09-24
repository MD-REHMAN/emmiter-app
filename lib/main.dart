import 'package:flutter/material.dart';
import 'package:emitter_app/models/store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(

        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.cyan,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: Scaffold(
              appBar: AppBar(title: Text('Shopping Mart')),
              body: Center(
                child: Row(
                  children: <Widget>[
                    Comp1(),
                    Text('                  '),
                    Comp2(),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                  onPressed: () {}, child: Icon(Icons.add_outlined)),
            )));
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
    // var some = context.inheritFromWidgetOfExactType(Provider).store;



    // Store store = Provider.of(context, ()=>setState(() {})).store;
    // Store store = Provider.store;
    Store store = Provider.getStore(()=>setState(() {}));

    
    
    
    // Store of(BuildContext context) =>
    //     context.inheritFromWidgetOfExactType(Provider) as Store;
    // var some = context.getElementForInheritedWidgetOfExactType<Provider>();
    // Store store = Store();
    // Store.setReloader(() => setState(() {}));
    return Row(children: [
      Text(store.getName()),
      FlatButton(
        color: Colors.cyan,
        textColor: Colors.white,
        padding: EdgeInsets.all(18.0),
        splashColor: Colors.blueAccent,
        onPressed: () {
          store.updateName('Peter Parker');
          // setState(() {});
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



    // Store store = Provider.of(context, ()=>setState(() {})).store;
    Store store = Provider.getStore(()=>setState(() {}));


    // Store store = Store();
    return Row(children: [
      Text(store.getName()),
      FlatButton(
        color: Colors.cyan,
        textColor: Colors.white,
        padding: EdgeInsets.all(18.0),
        splashColor: Colors.blueAccent,
        onPressed: () {
          store.updateName('Spider Man');
          // _Comp1State.setState();
          // setState(() {});
        },
        child: Text('Wear Mask'),
      )
    ]);
  }
}
