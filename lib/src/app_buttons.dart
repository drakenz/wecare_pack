import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RoundedButton extends StatelessWidget {
  final buttonText;
  final buttonRadius;
  final void Function()? onPressed;
  final int ColorHex;
  const RoundedButton(
      {Key? key,
      this.buttonText,
      this.buttonRadius,
      this.onPressed,
      required this.ColorHex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttonRadius))),
          backgroundColor: MaterialStateProperty.all(Color(ColorHex))),
    );
  }
}

class GradientRoundedButton extends StatelessWidget {
  final buttonText;
  final buttonRadius;
  final void Function()? onPressed;
  final List<Color> ColorList;
  const GradientRoundedButton(
      {Key? key,
      this.buttonText,
      this.buttonRadius,
      this.onPressed,
      required this.ColorList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(buttonRadius),
            gradient: LinearGradient(
                colors: ColorList,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)),
        child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(buttonRadius))),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
            )));
  }
}
