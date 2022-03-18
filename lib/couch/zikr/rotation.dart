import 'package:flutter/material.dart';

class RotAnim extends StatefulWidget {
  const RotAnim({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<RotAnim> createState() => _RotAnimState();
}

class _RotAnimState extends State<RotAnim> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation rotationAnim;
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10));

    rotationAnim = Tween<double>(begin: 0.0, end: 3.14).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
          print("complete");
        }
      });

    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (_, child) {
          return Transform.rotate(
              angle: controller.value * 2 * 3.14, child: widget.child);
        });
  }
}
