import 'package:flutter/material.dart';

class TajwidSubHeaderCard extends StatelessWidget {
  const TajwidSubHeaderCard({
    Key? key,
    required this.title,
    required this.num,
    required this.titleAr,
    required this.desc,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final String titleAr;
  final String desc;
  final int num;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$num. $title",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  titleAr,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            Text(
              desc,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
