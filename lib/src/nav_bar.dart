import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation sizeAnimation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    sizeAnimation = Tween<double>(begin: 50, end: 100).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
            _controller.repeat();
          });
        },
        items: [
          BottomNavigationBarItem(
              label: "Test1",
              icon: Container(
                height: sizeAnimation.value,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.person),
              )),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: "Test2")
        ]);
  }
}
