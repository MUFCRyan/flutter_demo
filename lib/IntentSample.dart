import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class IntentSample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Intent Sample',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new IntentSamplePage(),
    );
  }
}

class IntentSamplePage extends StatefulWidget{
  IntentSamplePage({Key key}): super(key: key);
  @override
  State<StatefulWidget> createState() => new _IntentSamplePageState();
}

class _IntentSamplePageState extends State<IntentSamplePage>{
  static const platform = const MethodChannel('app.channel.shared.data');
  String dataShared = 'No Data';

  @override
  void initState() {
    super.initState();
    getSharedText();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: new Center(child: new Text(dataShared)));
  }

  getSharedText() async {
    var sharedData = await platform.invokeMethod("getSharedText");
    if(sharedData != null){
      setState(() {
        dataShared = sharedData;
      });
    }
  }
}