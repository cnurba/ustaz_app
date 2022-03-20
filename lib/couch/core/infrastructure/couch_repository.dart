import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:muslim_app/couch/core/infrastructure/i_couch_repository.dart';
import 'package:muslim_app/couch/zikr/domain/zikr.dart';

class CouchRepository extends ICouchRepository {
  @override
  Future<List<Zikr>> getZikras() async {
    final _zikrString =
        await rootBundle.loadString('assets/data/zikr/zikr.json');

    final parsedZikr = jsonDecode(_zikrString) as List<dynamic>;
    await Future.delayed(const Duration(milliseconds: 200));

    List<Zikr> zikras = [];

    for (final zikr in parsedZikr) {
      final _zikr = Zikr.fromMap(zikr);
      zikras.add(_zikr);
    }

    return zikras;
  }
}
