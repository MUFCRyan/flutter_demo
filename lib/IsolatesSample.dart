import 'dart:convert';
import 'dart:isolate';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class IsolatesSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new IsolatesSamplePage(),
    );
  }
}

class IsolatesSamplePage extends StatefulWidget {
  IsolatesSamplePage({Key key}): super(key: key);
  @override
  State<StatefulWidget> createState() => _IsolatesSamplePageState();
}

class _IsolatesSamplePageState extends State{
  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Isolates Sample App'),),
      body: getBody(),
    );
  }

  showLoadingDialog(){
    return widgets.length == 0;
  }

  getBody(){
    if(showLoadingDialog()){
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  getProgressDialog(){
    return new Center(child: new CircularProgressIndicator());
  }

  ListView getListView() => new ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position){
        return getRow(position);
      });

  Widget getRow(int position){
    return new Padding(padding: new EdgeInsets.all(10.0), child: new Text('Row ${widgets[position]['title']}'));
  }

  loadData() async {
    ReceivePort receivePort = new ReceivePort();
    await Isolate.spawn(dataLoader, receivePort.sendPort);

    SendPort sendPort = await receivePort.first;

    List msg = await sendReceive(sendPort, 'https://jsonplaceholder.typicode.com/posts');
    setState(() {
      widgets = msg;
    });
  }

  // “dataLoader”是在它自己的独立执行线程中运行的隔离区，您可以在其中执行CPU密集型任务
  static dataLoader(SendPort sendPort) async{
    ReceivePort receivePort = new ReceivePort();
    sendPort.send(receivePort.sendPort);
    await for(var msg in receivePort){
      String data = msg[0];
      SendPort replyTo = msg[1];

      String dataUrl = data;
      http.Response response = await http.get(dataUrl);
      // Lots of JSON to parse
      replyTo.send(jsonDecode(response.body));
    }
  }

  Future sendReceive(SendPort port, msg){
    ReceivePort response = new ReceivePort();
    port.send([msg, response.sendPort]);
    return response.first;
  }

}