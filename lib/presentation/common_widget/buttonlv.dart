import 'package:flutter/material.dart';

class BaseIconWriting extends StatelessWidget {
  final Widget? content;
  final Widget? child;

  const BaseIconWriting({
    Key? key,
    this.content,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.orange,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(1.5, 3),
            )
          ]),
      // height: 50,
      // width: 50,
      // decoration: const BoxDecoration(
      //   shape: BoxShape.circle,
      // ),
      child: child,
    );
  }
}

class OnTapIcon extends StatelessWidget {
  final VoidCallback? onPress;
  final Icon? icon;

  const OnTapIcon({
    Key? key,
    this.onPress,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseIconWriting(
      child: GestureDetector(
        onTap: onPress,
        child: icon,
      ),
    );
  }
}

class OnTapDownIcon extends StatelessWidget {
  final Widget? content;
  final void Function(TapDownDetails)? onTapDown;
  final Icon? icon;

  const OnTapDownIcon({
    Key? key,
    this.content,
    this.onTapDown,
    this.icon,
  }) : super(key: key);

  void _onTapDown(
      TapDownDetails details,
      BuildContext context,
      ) async {
    final RenderBox renderBox =
    Overlay.of(context)!.context.findRenderObject() as RenderBox;
    await showMenu(
      context: context,
      position: RelativeRect.fromRect(
        details.globalPosition & const Size(0, 0),
        Offset.zero & renderBox.size,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      items: [
        PopupMenuItem(
          padding: EdgeInsets.zero,
          child: content,
          onTap: () {

          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseIconWriting(
      child: GestureDetector(
        onTapDown: (details) {
          _onTapDown(details, context);
          if (onTapDown != null) {
            onTapDown!(details);
          }
        },
        child: icon,
      ),
    );
  }
}