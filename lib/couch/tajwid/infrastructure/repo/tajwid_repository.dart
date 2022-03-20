import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:muslim_app/couch/tajwid/domain/models/tajwid/tajwid.dart';
import 'package:muslim_app/couch/tajwid/infrastructure/repo/i_tajwid_repository.dart';

class TajwidRepository implements ITajwidRepository {
  @override
  Future<Tajwid> getDataFromAssets() async {
    final _tajwidString =
        await rootBundle.loadString('assets/data/tajwid/tajwid.json');

    final parsedTajwid = jsonDecode(_tajwidString) as Map<String, dynamic>;

    await Future.delayed(const Duration(milliseconds: 200));

    final _tajwid = Tajwid.fromMap(parsedTajwid);

    return _tajwid;
  }
}
