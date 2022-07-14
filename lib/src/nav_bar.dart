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
    _controller.repeat(reverse: true);
    sizeAnimation = Tween<double>(begin: 50, end: 100).animate(_controller);
  }

  @override
  int currentIndex = 0;
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              label: "Test1",
              icon: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: ScaleTransition(
                  scale: Tween(begin: 0.75, end: 2.0).animate(CurvedAnimation(
                      parent: _controller, curve: Curves.bounceIn)),
                  child: const Icon(Icons.person),
                ),
              )),
          const BottomNavigationBarItem(icon: Icon(Icons.phone), label: "Test2")
        ]);
  }
}
