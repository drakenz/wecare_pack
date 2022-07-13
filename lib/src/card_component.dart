import 'package:flutter/material.dart';

class CardComponent extends StatefulWidget {
  final BuildContext ctx;
  final Widget child;
  final double height;
  const CardComponent(
      {Key? key, required this.ctx, required this.child, required this.height})
      : super(key: key);
  final BoxDecoration decoration = const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5), topRight: Radius.circular(5)));

  @override
  State<CardComponent> createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: widget.decoration,
      child: widget.child,
      alignment: Alignment.bottomCenter,
    );
  }
}
