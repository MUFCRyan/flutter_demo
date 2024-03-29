import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyCustomPaint extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(body: new Signature()),
    );
  }
}

class Signature extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _SignatureState();
}

class _SignatureState extends State<Signature>{
  List<Offset> _points = <Offset>[];
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new GestureDetector(
          onPanUpdate: (DragUpdateDetails details){
            setState(() {
              RenderBox referenceBox = context.findRenderObject();
              Offset localPosition = referenceBox.globalToLocal(details.globalPosition);
              _points = new List.of(_points)..add(localPosition);
            });
          },
          onPanEnd: (DragEndDetails details) => _points.add(null),
        ),
        new CustomPaint(painter: new SignaturePainter(_points))
      ],
    );
  }

}

class SignaturePainter extends CustomPainter{
  SignaturePainter(this.points);
  final List<Offset> points;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = new Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for(int i = 0; i < points.length - 1; i++){
      if(points[i] != null && points[i+1] != null){
        canvas.drawLine(points[i], points[i+1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(SignaturePainter other) => other.points != points;

}
