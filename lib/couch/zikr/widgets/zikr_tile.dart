import 'package:flutter/material.dart';
import 'package:muslim_app/couch/core/domain/models/zikr/zikr.dart';

class ZikrTile extends StatelessWidget {
  const ZikrTile({
    Key? key,
    required this.zikr,
    required this.onTap,
  }) : super(key: key);

  final Zikr zikr;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          ListTile(
            title: Text(
              zikr.nameAr,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  zikr.name,
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Text(
                  zikr.nameKg,
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 8,
            bottom: 0,
            child: CircleAvatar(
              backgroundColor: Colors.greenAccent.withOpacity(0.3),
              child: const Text(
                '0',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
