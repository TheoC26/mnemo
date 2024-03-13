import 'package:flutter/material.dart';
import 'package:mnemo_app/styles/background_styles.dart';

class ButtonFull extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final String color;
  final double size;

  late final Color bottomLeftColor;
  late final Color topRightColor;

  ButtonFull(
      {Key? key,
      this.onPressed,
      required this.text,
      this.color = 'purple',
      this.size = 20})
      : super(key: key) {
    if (color == 'purple') {
      bottomLeftColor = const Color(0xFFE2DAE9);
      topRightColor = const Color(0xFFE3D8E9);
    } else if (color == 'grey') {
      // color from this hex DFDFDF
      bottomLeftColor = const Color(0xFFE7E5E7);
      topRightColor = const Color(0xFFE7E7E7);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60,
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
        decoration: color == 'purple'
            ? purpleBackgroundDecoration
            : greyBackgroundDecoration,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: size,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
