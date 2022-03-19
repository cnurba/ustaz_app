import 'dart:convert';

import 'package:flutter/foundation.dart';

class Tajwid {
  final String name;
  final String nameAr;
  final String desc;
  final List<String> nun;
  final List<String> mim;
  final List<String> kalkala;
  Tajwid({
    required this.name,
    required this.nameAr,
    required this.desc,
    required this.nun,
    required this.mim,
    required this.kalkala,
  });
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'nameAr': nameAr,
      'desc': desc,
      'nun': nun,
      'mim': mim,
      'kalkala': kalkala,
    };
  }

  factory Tajwid.fromMap(Map<String, dynamic> map) {
    return Tajwid(
      name: map['name'] ?? '',
      nameAr: map['nameAr'] ?? '',
      desc: map['desc'] ?? '',
      nun: List<String>.from(['nun']),
      mim: List<String>.from(['mim']),
      kalkala: List<String>.from(['kalkala']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Tajwid.fromJson(String source) => Tajwid.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Tajwid(name: $name, nameAr: $nameAr, desc: $desc, nun:$nun, mim: $mim, kalkala: $kalkala,)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tajwid &&
        other.name == name &&
        other.nameAr == nameAr &&
        other.desc == desc &&
        listEquals(other.nun, nun) &&
        listEquals(other.mim, mim) &&
        listEquals(other.kalkala, kalkala);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        nameAr.hashCode ^
        desc.hashCode ^
        nun.hashCode ^
        mim.hashCode ^
        kalkala.hashCode;
  }

  toDomain() {}
}
