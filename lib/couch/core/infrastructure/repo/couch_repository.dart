import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:muslim_app/couch/core/domain/models/daarat/daarat.dart';
import 'package:muslim_app/couch/core/domain/models/dua/dua.dart';
import 'package:muslim_app/couch/core/domain/models/name/names.dart';

import 'package:muslim_app/couch/core/domain/models/tajwid/tajwid.dart';
import 'package:muslim_app/couch/core/domain/models/zikr/zikr.dart';

import 'package:muslim_app/couch/core/infrastructure/DTO/names_DTO.dart';
import 'package:muslim_app/couch/core/infrastructure/repo/i_couch_repository.dart';

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

  @override
  Future<List<Names>> getNames() async {
    final _namesString =
        await rootBundle.loadString('assets/data/couch/names.json');

    final parsedNamed = jsonDecode(_namesString) as List<dynamic>;

    List<Names> _names = [];

    for (var itemJson in parsedNamed) {
      final _name = NamesDTO.fromMap(itemJson).toDomain();
      _names.add(_name);
    }

    return _names;
  }

  @override
  Future<Tajwid> getTajwid() async {
    final _tajwidString =
        await rootBundle.loadString('assets/data/tajwid/tajwid.json');

    final parsedTajwid = jsonDecode(_tajwidString) as Map<String, dynamic>;

    await Future.delayed(const Duration(milliseconds: 200));

    final _tajwid = Tajwid.fromMap(parsedTajwid);

    return _tajwid;
  }

  @override
  Future<List<Dua>> getDuas() async {
    final _jsonString =
        await rootBundle.loadString('assets/data/dua/duas.json');

    final parsedJson = jsonDecode(_jsonString) as List<dynamic>;

    await Future.delayed(const Duration(milliseconds: 200));

    List<Dua> _duas = [];

    for (final itemJson in parsedJson) {
      final _name = Dua.fromMap(itemJson);
      _duas.add(_name);
    }

    return _duas;
  }

  @override
  Future<List<Daarat>> getDaarats() async {
    final _jsonString =
        await rootBundle.loadString('assets/data/daarat/daarat.json');

    final parsedJson = jsonDecode(_jsonString) as List<dynamic>;

    await Future.delayed(const Duration(milliseconds: 200));

    List<Daarat> _daarats = [];

    for (final itemJson in parsedJson) {
      final daarat = Daarat.fromMap(itemJson);
      _daarats.add(daarat);
    }

    return _daarats;
  }
}
