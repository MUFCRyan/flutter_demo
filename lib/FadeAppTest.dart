import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FadeAppTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Fade Demo',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: MyFadeTest(title: 'Fade Demo',),
    );
  }
}

class MyFadeTest extends StatefulWidget{
  MyFadeTest({Key key, this.title}): super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => _MyFadeTestState();
}

class _MyFadeTestState extends State<MyFadeTest> with TickerProviderStateMixin{
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(duration: const Duration(milliseconds: 2000),vsync: this);
    curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(widget.title)),
      body: new Center(
        child: new FadeTransition(opacity: curve, child: new FlutterLogo(size: 100),),
      ),
      floatingActionButton: new FloatingActionButton(
          tooltip: 'Fade',
          child: new Icon(Icons.brush),
          onPressed: (){
            controller.forward();
          }
          ),
    );
  }

}