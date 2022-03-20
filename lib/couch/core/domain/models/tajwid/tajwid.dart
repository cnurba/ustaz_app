import 'dart:convert';


import 'package:muslim_app/couch/core/domain/models/kalkala/kalkala.dart';
import 'package:muslim_app/couch/core/domain/models/mim/mim.dart';
import 'package:muslim_app/couch/core/domain/models/nun/nun.dart';



class Tajwid {
  final String name;
  final String nameAr;
  final String desc;
  final Nun nun;
  final Mim mim;
  final Kalkala kalkala;
  Tajwid({
    required this.name,
    required this.nameAr,
    required this.desc,
    required this.nun,
    required this.mim,
    required this.kalkala,
  });

  Tajwid copyWith({
    String? name,
    String? nameAr,
    String? desc,
    Nun? nun,
    Mim? mim,
    Kalkala? kalkala,
  }) {
    return Tajwid(
      name: name ?? this.name,
      nameAr: nameAr ?? this.nameAr,
      desc: desc ?? this.desc,
      nun: nun ?? this.nun,
      mim: mim ?? this.mim,
      kalkala: kalkala ?? this.kalkala,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'nameAr': nameAr,
      'desc': desc,
      'nun': nun.toMap(),
      'mim': mim.toMap(),
      'kalkala': kalkala.toMap(),
    };
  }

  factory Tajwid.fromMap(Map<String, dynamic> map) {
    return Tajwid(
      name: map['name'] ?? '',
      nameAr: map['nameAr'] ?? '',
      desc: map['desc'] ?? '',
      nun: Nun.fromMap(map['nun']),
      mim: Mim.fromMap(map['mim']),
      kalkala: Kalkala.fromMap(map['kalkala']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Tajwid.fromJson(String source) => Tajwid.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Tajwid(name: $name, nameAr: $nameAr, desc: $desc, nun: $nun, mim: $mim, kalkala: $kalkala)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tajwid &&
        other.name == name &&
        other.nameAr == nameAr &&
        other.desc == desc &&
        other.nun == nun &&
        other.mim == mim &&
        other.kalkala == kalkala;
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

  factory Tajwid.empty() => Tajwid(
        name: '',
        nameAr: '',
        desc: '',
        nun: Nun.empty(),
        mim: Mim.empty(),
        kalkala: Kalkala.empty(),
      );
}
