import 'package:flutter/material.dart';
import 'package:muslim_app/couch/tajwid/domain/models/nun/nun.dart';
import 'package:muslim_app/couch/tajwid/presentation/widgets/letters_widget.dart';
import 'package:muslim_app/couch/tajwid/presentation/widgets/tajwid_header_card.dart';

class NunScreen extends StatelessWidget {
  const NunScreen({
    Key? key,
    required this.nun,
  }) : super(key: key);

  final Nun nun;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: kBottomNavigationBarHeight),

          /// Display tajwid card
          TajwidHeaderCard(
            title: nun.title,
            titleAr: nun.titleAr,
            desc: nun.desc,
          ),
          const SizedBox(height: 12),

          const Text(
            'Бул эреже 4 болуктон турат',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 12),
          
          LettersWidget(letters: nun.types[0].letters), 
         
        ],
      ),
    );
  }
}
