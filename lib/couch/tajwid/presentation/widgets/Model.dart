import 'dart:convert';

import 'package:muslim_app/couch/names/domain/names.dart';

class NamesDTO {
  final String name;
  final String nameAr;
  final String desc;

  NamesDTO({
    required this.name,
    required this.nameAr,
    required this.desc,
  });
  Map<String, dynamic> tyMap() {
    return {
      'name': name,
      'nameAr': nameAr,
      'desc': desc,
    };
  }

  factory NamesDTO.fromMap(Map<String, dynamic> map) {
    return NamesDTO(
      name: map['name'] ?? '',
      nameAr: map[' nameAr'] ?? '',
      desc: map['desc'] ?? '',
    );
  }
  String toJson() => json.encode(tyMap());

  factory NamesDTO.fronJson(String soure) =>
      NamesDTO.fromMap(json.decode(soure));

  NamesDTO toDomain() => NamesDTO(name: name, nameAr: nameAr, desc: desc);
}
