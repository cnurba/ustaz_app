import 'package:muslim_app/couch/zikr/domain/zikr.dart';

abstract class ICouchRepository {

  
  Future<List<Zikr>> getZikras();
}
