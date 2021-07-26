
import 'package:flutter/material.dart';

class pathPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint = new Paint();
    paint.color = Colors.green.shade200;

    Path path = new Path();
    path.moveTo(0, 0);
    path.lineTo(size.width*0.5, 0);
    path.quadraticBezierTo(size.width*0.7, size.height*0.02, size.width*0.6, size.height*0.2);
    path.quadraticBezierTo(size.width*0.4, size.height*0.5, 0, size.height*0.45);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}