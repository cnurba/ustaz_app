import 'package:flutter/material.dart';

class LanguageStepButton extends StatelessWidget {
  const LanguageStepButton({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final String title;

  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.lightGreenAccent[400],
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 35,
        child: InkWell(
          onTap: onTap,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.tealAccent,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
