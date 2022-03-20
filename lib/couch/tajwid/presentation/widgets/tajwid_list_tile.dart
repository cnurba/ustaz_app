import 'package:flutter/material.dart';

class TajwidListTile extends StatelessWidget {
  const TajwidListTile(
      {Key? key, this.title = '', this.titleAr = '', this.desc = ''})
      : super(key: key);

  final String title;
  final String titleAr;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              titleAr,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        Text(
          desc,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}