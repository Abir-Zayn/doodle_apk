import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogoDisplay extends StatefulWidget {
  const LogoDisplay({super.key});

  @override
  State<LogoDisplay> createState() => _LogoDisplayState();
}

//SingleTickerProvider is necessary for animation controller for functioning properly.
class _LogoDisplayState extends State<LogoDisplay>
    with SingleTickerProviderStateMixin {
  //animation_controller manage the timing and execution.
  late AnimationController _controller;
  late Animation<double> _animation;

  //repeation has set for 2 sec and initialize the duration is 2 seconds
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward().then((_) {
        context.go('/splash_one');
      });
    //animation type has selected CurvedAnimation
    // and curve has set easeInOut to have smoother transition
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //FadeTransition deals with opacity mainly.
        child: FadeTransition(
          opacity: _animation,
          child: Image.asset('assets/logo/app_logo.png'),
        ),
      ),
    );
  }
}
