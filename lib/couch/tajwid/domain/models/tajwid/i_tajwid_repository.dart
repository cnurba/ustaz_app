
import 'package:muslim_app/couch/tajwid/domain/models/tajwid/tajwid_madel.dart';


abstract class Repository {
   Future<List<Tajwid>> getDataFromAssets(); 
  
}