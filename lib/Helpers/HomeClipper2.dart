import 'package:flutter/material.dart';

class HomeClippers2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height-200);
    path.quadraticBezierTo(size.width/3, size.height/2, size.width/2, size.height-100);
    path.quadraticBezierTo(size.width-(size.width/3), size.height, size.width, size.height);
    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}