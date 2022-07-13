import 'package:flutter/material.dart';

abstract class AppTheme {
  Widget backgroundColors(BuildContext ctx);
}

class UserApp extends AppTheme {
  @override
  Widget backgroundColors(BuildContext ctx) {
    return Container(
      width: MediaQuery.of(ctx).size.width,
      height: MediaQuery.of(ctx).size.height,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xff00ffcf), Color(0xff8250FA)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
    );
  }
}
