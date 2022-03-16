import 'package:muslim_app/couch/names/domain/names.dart';

abstract class INamesRepository{
    Future<List<Names>> getDataFromAssets(); 
}