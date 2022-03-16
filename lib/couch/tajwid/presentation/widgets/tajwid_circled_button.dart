import 'package:flutter/material.dart';

class TajwidCircledButton extends StatelessWidget {
  const TajwidCircledButton({
    Key? key,
    required this.title,
    required this.titleAr,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String titleAr;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: onTap,
      highlightColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(32),
        child: RichText(
          softWrap: true,
          textAlign: TextAlign.center,
          overflow: TextOverflow.clip,
          text: TextSpan(
            text: title,
            children: [
              TextSpan(
                text: titleAr,
                style: const TextStyle(color: Colors.green, fontSize: 22)
              ),
            ],
          ),
        ),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
          gradient:  RadialGradient(
            center: Alignment.topCenter,
            focalRadius: 30 ,
            tileMode: TileMode.clamp,
            colors: [
              Colors.white,
              Colors.blueGrey,
            ],
          ),
        ),
      ),
    );
  }
}
