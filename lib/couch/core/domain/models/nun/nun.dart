import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:muslim_app/couch/core/domain/models/nun/nun_type.dart';


class Nun {
  final int id;
  final String title;
  final String titleAr;
  final String desc;
  final List<NunType> types;
  Nun({
    required this.id,
    required this.title,
    required this.titleAr,
    required this.desc,
    required this.types,
  });

  Nun copyWith({
    int? id,
    String? title,
    String? titleAr,
    String? desc,
    List<NunType>? types,
  }) {
    return Nun(
      id: id ?? this.id,
      title: title ?? this.title,
      titleAr: titleAr ?? this.titleAr,
      desc: desc ?? this.desc,
      types: types ?? this.types,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'titleAr': titleAr,
      'desc': desc,
      'types': types.map((x) => x.toMap()).toList(),
    };
  }

  factory Nun.fromMap(Map<String, dynamic> map) {
    return Nun(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      titleAr: map['titleAr'] ?? '',
      desc: map['desc'] ?? '',
      types: List<NunType>.from(map['types']?.map((x) => NunType.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Nun.fromJson(String source) => Nun.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Nun(id: $id, title: $title, titleAr: $titleAr, desc: $desc, types: $types)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Nun &&
        other.id == id &&
        other.title == title &&
        other.titleAr == titleAr &&
        other.desc == desc &&
        listEquals(other.types, types);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        titleAr.hashCode ^
        desc.hashCode ^
        types.hashCode;
  }

  factory Nun.empty() => Nun(
        id: 0,
        title: '',
        titleAr: '',
        desc: '',
        types: [],
      );
}
