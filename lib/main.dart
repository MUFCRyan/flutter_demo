import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/ComposedWidgetSample.dart';
import 'package:flutter_demo/LifecycleWatcher.dart';
import 'package:flutter_demo/TextSample.dart';
import 'package:flutter_demo/TutorialHome.dart';
import 'package:flutter_demo/WidgetUtil.dart';
import 'package:flutter_demo/CustomPaint.dart';
import 'package:flutter_demo/FadeAppTest.dart';
import 'package:flutter_demo/IsolatesSample.dart';
import 'package:flutter_demo/ParentWidget.dart';
import 'package:flutter_demo/TourInfo.dart';
import 'package:flutter_demo/shopping/ShoppingList.dart';

//import 'RandomWords.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return TourInfo.getPage(context);
    //return ParentWidget.getParent();
    //return new MyCustomPaint();
    //return new IsolatesSample();
    //return WidgetUtil.getAppPage(new LifecycleWatcher());
    //return WidgetUtil.getAppPage(new TextSample());
    //return WidgetUtil.getAppPage(new ComposedScaffold());
    //return WidgetUtil.getAppPage(new TutorialHome());
    return WidgetUtil.getAppPage(ShoppingList.getShoppingList());
  }
}

abstract class Shape{
  num get area;
}

class Circle implements Shape{
  final num radius;
  Circle(this.radius);
  @override
  num get area => pi * pow(radius, 2);
}