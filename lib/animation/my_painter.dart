import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  final double rippleRadius;
  final double rippleOpacity;
  var context;


  MyPainter(this.context,this.rippleRadius, this.rippleOpacity);

  @override
  void paint(Canvas canvas, Size size) {
    //Outer ripple effect
    var firstPaint = Paint()
    // opacity dynamically controlled-> creates the effect of the ripple fading out as it expands
      ..color = Theme.of(context).focusColor.withOpacity(rippleOpacity)
      ..style = PaintingStyle.fill;

    // the radius changes dynamically with the animation, making the expand outward
    canvas.drawCircle(
        Offset(size.width * .5, size.height * .5), rippleRadius, firstPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}