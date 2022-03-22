import 'package:muslim_app/couch/core/domain/models/daarat/daarat.dart';
import 'package:muslim_app/couch/core/domain/models/dua/dua.dart';
import 'package:muslim_app/couch/core/domain/models/namaz/namaz.dart';
import 'package:muslim_app/couch/core/domain/models/name/names.dart';
import 'package:muslim_app/couch/core/domain/models/tajwid/tajwid.dart';
import 'package:muslim_app/couch/core/domain/models/zikr/zikr.dart';

abstract class ICouchRepository {
  Future<List<Zikr>> getZikras();

  Future<Tajwid> getTajwid();

  Future<List<Names>> getNames();
  Future<List<Dua>> getDuas();
  Future<List<Daarat>> getDaarats();
  Future<List<Namaz>> getNamazes();
}
