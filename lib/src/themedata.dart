import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

//Gradient Background
Widget backgroundColors(BuildContext ctx, Widget child) {
  return Container(
    width: MediaQuery.of(ctx).size.width,
    height: MediaQuery.of(ctx).size.height,
    decoration: const BoxDecoration(
        gradient: LinearGradient(
      colors: [Color(0xff00ffcf), Color(0xff8250FA)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    )),
    child: child,
  );
}
//Card Component Shown on the start screen on both versions


