import 'package:flutter/material.dart';
import 'package:muslim_app/couch/core/domain/models/tajwid/tajwid.dart';
import 'package:muslim_app/couch/core/infrastructure/repo/couch_repository.dart';
import 'package:muslim_app/couch/core/presentation/couch_back_button.dart';

import 'package:muslim_app/couch/tajwid/presentation/nun_screen.dart';

import 'package:muslim_app/couch/tajwid/presentation/widgets/tajwid_header_card.dart';
import 'package:muslim_app/couch/tajwid/presentation/widgets/tajwid_sub_header_card.dart';

class TajwidScreen extends StatelessWidget {
  const TajwidScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: FutureBuilder<Tajwid>(
          future: CouchRepository().getTajwid(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final tajwid = snapshot.data!;
              return Stack(
                children: [
                  ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      const SizedBox(height: 20),

                      const SizedBox(height: 20),

                      /// Display tajwid card
                      TajwidHeaderCard(
                        title: tajwid.name,
                        titleAr: tajwid.nameAr,
                        desc: tajwid.desc,
                      ),
                      const SizedBox(height: 12),

                      TajwidSubHeaderCard(
                        title: tajwid.nun.title,
                        titleAr: tajwid.nun.titleAr,
                        desc: tajwid.nun.desc,
                        num: 1,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return NunScreen(nun: tajwid.nun);
                              },
                            ),
                          );
                        },
                      ),
                      TajwidSubHeaderCard(
                        title: tajwid.mim.title,
                        titleAr: tajwid.mim.titleAr,
                        desc: '',
                        num: 2,
                        onPressed: () {},
                      ),

                      TajwidSubHeaderCard(
                        title: tajwid.kalkala.title,
                        titleAr: tajwid.kalkala.title,
                        desc: tajwid.kalkala.desc,
                        num: 3,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const Positioned(
                    top: 30,
                    left: 16,
                    child: CouchBackButton(),
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
