import 'package:flutter/material.dart';
import 'package:muslim_app/couch/tajwid/domain/models/nun/nun.dart';
import 'package:muslim_app/couch/tajwid/presentation/widgets/exemple_widget.dart';
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
        physics: const BouncingScrollPhysics(),
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

          ListView.builder(
            shrinkWrap: true,
            itemCount: nun.types.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final nunType = nun.types[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(nunType.title),
                        Text(nunType.titleAr),
                      ],
                    ),
                    subtitle: Text(nunType.desc),
                  ),
                  const Text('Томонку тамгалар'),
                  LettersWidget(letters: nunType.letters),
                  ExampleWidget(examples:nunType.examples), 
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: nunType.types.length,
                    itemBuilder: (context, index) {
                      final idgam = nunType.types[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(idgam.title),
                                Text(idgam.titleAr),
                              ],
                            ),
                            subtitle: Text(idgam.desc),
                          ),
                          const Text('Томонку тамгалар'),
                          LettersWidget(letters: idgam.letters),
                        ],
                      );
                    },
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
