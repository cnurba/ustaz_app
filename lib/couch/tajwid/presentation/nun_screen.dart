import 'package:flutter/material.dart';
import 'package:muslim_app/couch/core/domain/models/nun/nun.dart';
import 'package:muslim_app/couch/core/presentation/couch_back_button.dart';
import 'package:muslim_app/couch/tajwid/presentation/widgets/exemple_widget.dart';
import 'package:muslim_app/couch/tajwid/presentation/widgets/letters_widget.dart';
import 'package:muslim_app/couch/tajwid/presentation/widgets/tajwid_header_card.dart';
import 'package:muslim_app/couch/tajwid/presentation/widgets/tajwid_list_tile.dart';

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
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            children: [
              const SizedBox(height: 40),

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

              ListView.builder(
                shrinkWrap: true,
                itemCount: nun.types.length,
                physics: const NeverScrollableScrollPhysics(),
                //padding: const EdgeInsets.only(top: 8),
                itemBuilder: (context, index) {
                  final nunType = nun.types[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TajwidListTile(
                        title: nunType.title,
                        titleAr: nunType.titleAr,
                        desc: nunType.desc,
                      ),
                      ListTile(
                        title: LettersWidget(letters: nunType.letters),
                        subtitle: ExampleWidget(examples: nunType.examples),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: nunType.types.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          final idgam = nunType.types[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TajwidListTile(
                                title: idgam.title,
                                titleAr: idgam.titleAr,
                                desc: idgam.desc,
                              ),
                              ListTile(
                                title: LettersWidget(letters: idgam.letters),
                              ),
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
         const Positioned(
            top: 30,
            left: 16,
            child: 
            CouchBackButton(), 
          ),
        ],
      ),
    );
  }
}
