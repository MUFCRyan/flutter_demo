import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TutorialHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(icon: new Icon(Icons.menu), tooltip: 'Navigation menu', onPressed: null),
        title: new Text('Example Title'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), tooltip: 'Search', onPressed: null)
        ],
      ),
      body: new Center(child: new Text('Hello World!'),),
      floatingActionButton: new FloatingActionButton(child: new Icon(Icons.add), tooltip: 'Add', onPressed: null),
    );
  }
}