
import 'package:flutter/material.dart';

class AnimatedImage extends StatefulWidget {
  const AnimatedImage({Key key}) : super(key: key);

  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(seconds: 4), vsync: this)..repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Animation<Offset> _animation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0,0.08),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    return SlideTransition(
      position: _animation,
      child: Image.asset('assets/doctor group 1.png'),
    );
  }
}
