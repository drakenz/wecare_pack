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
