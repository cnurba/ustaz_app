import 'package:muslim_app/couch/tajwid/domain/models/tajwid/tajwid.dart';

abstract class ITajwidRepository {
  Future<Tajwid> getDataFromAssets();
}
