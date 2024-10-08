import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'getStarted.dart';
import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController and Animation
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // Animation duration
    );

    _animation = Tween<double>(begin: 0.8, end: -1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();

    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => GetStarted()), // Your home screen widget
      );
    });
  }





    // Start the animation


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/img.png'),fit: BoxFit.cover)
        ),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Align(
              alignment: Alignment(_animation.value, 0.6), // Y-axis movement upwards
              child: Image.asset(
                'assets/images/pngegg 3.png', // Rocket image
                width: 200, // Adjust the size of the rocket as needed
                height: 400,
              ),
            );
          },
        ),
      ),

    );
  }
}
