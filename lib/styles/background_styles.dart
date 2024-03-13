import 'package:flutter/material.dart';

final BoxDecoration greyBackgroundDecoration = BoxDecoration(
  gradient: const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color.fromARGB(255, 241, 241, 241),
      Color(0xFFE7E7E7),
    ],
  ),
  boxShadow: const [
    BoxShadow(
      color: Color.fromARGB(62, 0, 0, 0),
      offset: Offset(0, 4),
      spreadRadius: -6,
      blurRadius: 8,
    ),
  ],
  borderRadius: BorderRadius.circular(15),
  border: Border.all(
    color: const Color.fromARGB(255, 255, 255, 255),
    width: 1,
  ),
);

final BoxDecoration purpleBackgroundDecoration = BoxDecoration(
  gradient: const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color(0xFFE2DAE9),
      Color(0xFFE3D8E9),
    ],
  ),
  boxShadow: const [
    BoxShadow(
      color: Color(0xFFD7C9E2),
      offset: Offset(0, 4),
      spreadRadius: -6,
      blurRadius: 8,
    ),
  ],
  borderRadius: BorderRadius.circular(15),
  border: Border.all(
    color: const Color.fromARGB(255, 255, 255, 255),
    width: 1,
  ),
);

// make this variable accessable by any file