import 'package:flutter/material.dart';
import 'package:flutter_translator_app/cubit/speech_to_text/speech_to_text_cubit.dart';
import 'package:flutter_translator_app/dependency_injection/locator.dart';
import '../animation/my_painter.dart';

class RippleAnimation extends StatefulWidget {
  const RippleAnimation({super.key});

  @override
  State<RippleAnimation> createState() => _RippleAnimationState();
}

class _RippleAnimationState extends State<RippleAnimation> with TickerProviderStateMixin {
  late Animation<double> _rippleRadius;// controls the size of the outer ripple (with radius)
  late Animation<double> _rippleOpacity;// controls fade out effect (with opacity)
  late AnimationController _rippleController;

  @override
  void initState() {
    super.initState();
    _rippleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));

    _rippleRadius = Tween<double>(begin: 0.0, end: 70).animate(
      CurvedAnimation(
        parent: _rippleController,
        curve: Curves.ease,
      ),

    )
    ..addListener(() {setState(() {

    });})
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _rippleController.repeat();// restart continuously in a loop
        } else if (status == AnimationStatus.dismissed) {
          _rippleController.forward();
        }
      });

    _rippleOpacity = Tween<double>(begin: 1.0, end: 0).animate(
      CurvedAnimation(
        parent: _rippleController,
        curve: Curves.ease
      ),)..addListener(() {setState(() {

    });});

  }
  @override
  void dispose() {
    _rippleController.dispose();
    super.dispose();


  }

  void triggerRipple(){
    _rippleController.forward();

  }
  void stopRipple(){
    _rippleController.stop();
    _rippleController.reset();

  }

  @override
  Widget build(BuildContext context) {
    if(locator<SpeechCubit>().getIsListening()){
      triggerRipple();
    }
    else{
      stopRipple();
    }
    return CustomPaint(
      painter: MyPainter(
        context,
        _rippleRadius.value,
        _rippleOpacity.value,
      ),
      size: const Size(100, 100), // Adjust size as needed
    );
  }
}
