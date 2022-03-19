import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:muslim_app/couch/tajwid/domain/models/tajwid/tajwid_madel.dart';

class TajwidRepository implements ITajwidRepository {
  @override
  Future<List<Tajwid>> getDataFromAssets() async {
    final _tajwidString =
        await rootBundle.loadString('assets/data/tajwid/tajwid.json');

    final parsedTajwid = jsonDecode(_tajwidString) as List<dynamic>;

    List<Tajwid> _tajwid = [];

    for (var itemJson in parsedTajwid) {
      final _tajwid = Tajwid.fromMap(itemJson).toDomain();
      _tajwid.add(_tajwid);
    }

    return _tajwid;
  }
}

class ITajwidRepository {
}



