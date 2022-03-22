import 'package:flutter/material.dart';
import 'package:muslim_app/core/custom_page_route.dart';
import 'package:muslim_app/couch/core/presentation/couch_button.dart';
import 'package:muslim_app/couch/daarat/daarat_screen.dart';
import 'package:muslim_app/couch/dua/dua_screen.dart';
import 'package:muslim_app/couch/language/presentation/language_screen.dart';
import 'package:muslim_app/couch/namaz/namaz_screen.dart';
import 'package:muslim_app/couch/names/presentation/names_screen.dart';
import 'package:muslim_app/couch/shahada/shahada_screen.dart';
import 'package:muslim_app/couch/zikr/zikr_screen.dart';

import 'tajwid/presentation/tajwid_screen.dart';

/// Main couth screen.
class CouchScreen extends StatelessWidget {
  const CouchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //appBar: AppBar(),
        body: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ).add(const EdgeInsets.only(top: 60)),
          children: [
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
                title: 'Куран', url: 'assets/couch/kuran.png', onTap: () {}),
            CouchButton(
                title: 'Шахада',
                url: 'assets/couch/shahada.png',
                onTap: () {
                  Navigator.of(context)
                      .push(CustomPageRoute(child: const ShahadaScreen()));
                }),
            CouchButton(
                title: 'Даарат',
                url: 'assets/couch/daarat.png',
                onTap: () {
                  Navigator.of(context)
                      .push(CustomPageRoute(child: const DaaratScreen()));
                }),
            CouchButton(
                title: 'Намаз',
                url: 'assets/couch/namaz.png',
                onTap: () {
                  Navigator.of(context)
                      .push(CustomPageRoute(child: const NamazScreen()));
                }),
            // CouchButton(
            //     title: 'Хадис', url: 'assets/couch/hadis.jpeg', onTap: () {}),

            CouchButton(
              title: 'Зикир',
              url: 'assets/couch/zikir.png',
              onTap: () {
                Navigator.of(context)
                    .push(CustomPageRoute(child: const ZikrScreen()));
              },
            ),

            CouchButton(
                title: 'Дуба',
                url: 'assets/couch/dua.png',
                onTap: () {
                  Navigator.of(context).push(
                    CustomPageRoute(
                      child: const DuaScreen(),
                    ),
                  );
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
