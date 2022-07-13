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

class CardComponent {
  late BuildContext ctx;
  late Widget child;
  late double height;
  CardComponent(BuildContext ctx, Widget child) {
    this.ctx = ctx;
    this.child = child;
    if (this.height == null) {
      this.height = (MediaQuery.of(ctx).size.height / 3) * 2;
    }
  }
  BoxDecoration decoration = const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5), topRight: Radius.circular(5)));

  Widget CardBuild() {
    return Container(
      height: this.height,
      decoration: decoration,
      child: this.child,
    );
  }
}
