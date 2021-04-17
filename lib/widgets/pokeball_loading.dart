import 'dart:math';

import 'package:flutter/material.dart';

class PokeballLoading extends StatefulWidget {
  @override
  _PokeballLoadingState createState() => _PokeballLoadingState();
}

class _PokeballLoadingState extends State<PokeballLoading> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> angleAnimation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2), upperBound: pi * 2);

    angleAnimation = Tween<double>(begin: 0.0, end: 5.0).animate(animationController)
      ..addListener(() {
        if (animationController.isCompleted) {
          animationController.repeat();
        }
      });

    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, _) {
            return Transform.rotate(
              angle: angleAnimation.value,
              child: Image.asset(
                'assets/pokebola.png',
                width: 50.0,
                height: 50.0,
              ),
            );
          },
        ),
      ),
    );
  }
}
