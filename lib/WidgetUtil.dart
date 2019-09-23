
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WidgetUtil {
  static MaterialApp getAppPage(Widget widget){
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter Demo'),
        ),
        body: widget,
      ),
    );
  }
}