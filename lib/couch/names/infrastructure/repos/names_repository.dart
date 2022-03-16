import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:muslim_app/couch/names/domain/names.dart';
import 'package:muslim_app/couch/names/infrastructure/repos/i_names_repository.dart';

import '../DTO/names_DTO.dart';

class NamesRepository implements INamesRepository {
  @override
  Future<List<Names>> getDataFromAssets() async {
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
}
