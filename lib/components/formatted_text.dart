import 'package:flutter/material.dart';

class FormattedText extends StatelessWidget {
  final String before;
  final String bold;
  final String after;

  const FormattedText(
      {Key? key, required this.before, required this.bold, required this.after})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$before ',
        style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            height: 1.3),
        children: <TextSpan>[
          TextSpan(
              text: bold,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
          TextSpan(
              text: ' $after',
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.black)),
        ],
      ),
    );
  }
}
