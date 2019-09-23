import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class _ComposedAppBar extends StatelessWidget {
  _ComposedAppBar({this.title});
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0, // 单位：逻辑像素
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      // Row 水平方向布局
      child: new Row(
        children: <Widget>[
          new IconButton(icon: new Icon(Icons.menu), tooltip: 'Navigation ''Menu', onPressed: null),
          new Expanded(child: title),
          new IconButton(icon: new Icon(Icons.search), tooltip: 'Search', onPressed: null),
        ],
      ),
    );
  }
}

class ComposedScaffold extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
          new _ComposedAppBar(title: new Text('Example title', style: Theme.of(context).primaryTextTheme.title,),),
          new Expanded(child: new Center(child: new Text('Hello, Ryan!'),)),
        ],
      ),
    );
  }
}