import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  late void Function() animate;
  final double elevation;
  final List<BottomNavBarItem> items;
  late int previousIndex;
  late int selectedIndex;
  static _BottomNavBarState? of(BuildContext context) =>
      context.findAncestorStateOfType<_BottomNavBarState>();
  BottomNavBar(
      {Key? key,
      required this.elevation,
      required this.items,
      this.selectedIndex = 0,
      this.previousIndex = 0})
      : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    super.initState();
    giveItemsIndexes(widget.items);
    widget.animate = () {
      widget.items[widget.selectedIndex].anim.call();
      widget.items[widget.previousIndex].anim.call();
    };
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.black87,
      surfaceTintColor: Colors.black,
      elevation: widget.elevation,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            color: Colors.white10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [for (var item in widget.items) item],
            ),
          ),
        ],
      ),
    );
  }

  void giveItemsIndexes(List<BottomNavBarItem> Items) {
    for (int i = 0; i < Items.length; i++) {
      Items[i]._index = i;
    }
  }
}

class BottomNavBarItem extends StatefulWidget {
  final Duration animation_duration;
  // ignore: non_constant_identifier_names
  final Color? backgroundcolor;
  final Color? fontColor;
  final void Function() onTapped;
  final String label;
  late bool animate;
  late int _index;
  late void Function() anim;
  final Icon childIcon;

  BottomNavBarItem({
    Key? key,
    required this.animation_duration,
    required this.label,
    this.backgroundcolor = Colors.white,
    this.fontColor = Colors.blue,
    this.animate = false,
    required this.onTapped,
    required this.childIcon,
  }) : super(key: key);

  @override
  State<BottomNavBarItem> createState() => _BottomNavBarItemState();
}

class _BottomNavBarItemState extends State<BottomNavBarItem> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    widget.anim = animate;
    super.initState();
  }

  void animate() {
    setState(() {
      widget.animate = !widget.animate;
    });
  }

  void HandleTap(BuildContext context) {
    if (widget._index == BottomNavBar.of(context)!.widget.selectedIndex) {
      //do nothing

    } else {
      BottomNavBar.of(context)!.widget.previousIndex =
          BottomNavBar.of(context)!.widget.selectedIndex;
      BottomNavBar.of(context)!.widget.selectedIndex = widget._index;
      BottomNavBar.of(context)!.widget.animate.call();
      widget.onTapped();
    }
  }

  @override
  Widget build(BuildContext context) {
    double minHeight = MediaQuery.of(context).size.height * 0.08 * 0.85;
    double minWidth = MediaQuery.of(context).size.height * 0.08 * 0.85;
    double maxWidth = MediaQuery.of(context).size.height * 0.08 * 1.25;
    double maxHeight = MediaQuery.of(context).size.height * 0.08 * 1.25;
    return Wrap(
      verticalDirection: VerticalDirection.up,
      children: [
        GestureDetector(
          onTap: () => HandleTap(context),
          child: AnimatedContainer(
            curve: Curves.easeInCirc,
            width:
                widget._index == BottomNavBar.of(context)!.widget.selectedIndex
                    ? maxWidth
                    : minWidth,
            height:
                widget._index == BottomNavBar.of(context)!.widget.selectedIndex
                    ? maxHeight
                    : minHeight,
            duration: widget.animation_duration,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                shape: BoxShape.circle,
                color: widget.backgroundcolor),
            child: Column(
              children: [
                widget.childIcon,
                Text(
                  widget.label,
                  style: TextStyle(color: widget.fontColor),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
