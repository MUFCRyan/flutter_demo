import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextSample extends StatefulWidget {
  TextSample({Key key}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _TextSampleState();
  }
}

class _TextSampleState extends State<TextSample>{
  String _errorText;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Text Sample'),),
      body: new Center(child: new TextField(
        onSubmitted: (String text){
          setState(() {
            if(!isEmail(text)){
              _errorText = 'Error: This is not an email';
            } else {
              _errorText = null;
            }
          });
        },
        decoration: new InputDecoration(hintText: "This is a hint",
            errorText: _getErrorText()),
      ),),
    );
  }

  isEmail(String text){
    String emailRegexp = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(emailRegexp);
    return regExp.hasMatch(text);
  }

  _getErrorText(){
    return _errorText;
  }
}