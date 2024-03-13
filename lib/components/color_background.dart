import 'package:flutter/material.dart';

class ColorBackground extends StatelessWidget {
  final Widget child;

  const ColorBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/backgrounds/Onboarding.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
