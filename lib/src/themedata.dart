import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

//Gradient Background

class Background extends StatefulWidget {
  final BuildContext ctx;
  final Widget child;
  const Background({Key? key, required this.ctx, required this.child})
      : super(key: key);

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(widget.ctx).size.width,
      height: MediaQuery.of(widget.ctx).size.height,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xff00ffcf), Color(0xff8250FA)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: widget.child,
    );
  }
}
//Card Component Shown on the start screen on both versions


