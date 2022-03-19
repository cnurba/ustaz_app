import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:muslim_app/couch/tajwid/domain/models/mim/mim_type.dart';

class Mim {
  final int id;
  final String title;
  final String titleAr;
  final List<MimType> types;
  Mim({
    required this.id,
    required this.title,
    required this.titleAr,
    required this.types,
  });

  Mim copyWith({
    int? id,
    String? title,
    String? titleAr,
    List<MimType>? types,
  }) {
    return Mim(
      id: id ?? this.id,
      title: title ?? this.title,
      titleAr: titleAr ?? this.titleAr,
      types: types ?? this.types,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'titleAr': titleAr,
      'types': types.map((x) => x.toMap()).toList(),
    };
  }

  factory Mim.fromMap(Map<String, dynamic> map) {
    return Mim(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      titleAr: map['titleAr'] ?? '',
      types: List<MimType>.from(map['types']?.map((x) => MimType.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Mim.fromJson(String source) => Mim.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Mim(id: $id, title: $title, titleAr: $titleAr, types: $types)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Mim &&
        other.id == id &&
        other.title == title &&
        other.titleAr == titleAr &&
        listEquals(other.types, types);
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ titleAr.hashCode ^ types.hashCode;
  }

  factory Mim.empty() => Mim(
        id: 0,
        title: '',
        titleAr: '',
        types: [],
      );
}
