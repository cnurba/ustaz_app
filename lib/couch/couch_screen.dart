import 'package:flutter/material.dart';
import 'package:muslim_app/couch/core/presentation/couch_button.dart';
import 'package:muslim_app/couch/language/presentation/language_screen.dart';
import 'package:muslim_app/couch/names/presentation/names_screen.dart';
import 'package:muslim_app/couch/zikr/zikr_screen.dart';

import 'tajwid/presentation/tajwid_screen.dart';

/// Main couth screen.
class CouchScreen extends StatelessWidget {
  const CouchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          children: [
            CouchButton(
                title: 'Куран',
                url: 'assets/couch/kuran.png',
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ZikrScreen();
                  }));
                }),
            CouchButton(
                title: 'Зикир', url: 'assets/couch/zikir.png', onTap: () {}),
            CouchButton(
              title: '99 Ысым',
              url: 'assets/couch/names.png',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const NamesScreen();
                    },
                  ),
                );
              },
            ),
            CouchButton(
                title: 'Дуба', url: 'assets/couch/dua.png', onTap: () {}),
            CouchButton(
                title: 'Даарат', url: 'assets/couch/daarat.png', onTap: () {}),
            CouchButton(
                title: 'Намаз', url: 'assets/couch/namaz.png', onTap: () {}),
            CouchButton(
                title: 'Шахада',
                url: 'assets/couch/shahada.png',
                onTap: () {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   return const ShahadatWidget();
                  // }));
                }),
            CouchButton(
                title: 'Тажвид',
                url: 'assets/couch/tajwid.png',
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const TajwidScreen();
                  }));
                }),
            CouchButton(
                title: 'Араб тили',
                url: 'assets/couch/til.png',
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const LanguageScreen();
                  }));
                }),
          ],
        ),
      ),
    );
  }
}
