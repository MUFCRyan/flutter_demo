import 'package:flutter/material.dart';
import 'package:flutter_demo/tourInfo.dart';

//import 'randomWords.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TourInfo.getPage(context);
  }
}
