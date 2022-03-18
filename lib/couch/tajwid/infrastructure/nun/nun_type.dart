import 'dart:convert';

import 'package:flutter/foundation.dart';



class NunType {
  final int id;
  final String title;
  final String titleAr;
  final String desc;
  final List<String> letters;
  final List<String> examples;
  final List<String> types;
  NunType({
    required this.id,
    required this.title,
    required this.titleAr,
    required this.desc,
    required this.letters,
    required this.examples,
    required this.types,
  });


  NunType copyWith({
    int? id,
    String? title,
    String? titleAr,
    String? desc,
    List<String>? letters,
    List<String>? examples,
    List<String>? types,
  }) {
    return NunType(
      id: id ?? this.id,
      title: title ?? this.title,
      titleAr: titleAr ?? this.titleAr,
      desc: desc ?? this.desc,
      letters: letters ?? this.letters,
      examples: examples ?? this.examples,
      types: types ?? this.types,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'titleAr': titleAr,
      'desc': desc,
      'letters': letters,
      'examples': examples,
      'types': types,
    };
  }

  factory NunType.fromMap(Map<String, dynamic> map) {
    return NunType(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      titleAr: map['titleAr'] ?? '',
      desc: map['desc'] ?? '',
      letters: List<String>.from(map['letters']),
      examples: List<String>.from(map['examples']),
      types: List<String>.from(map['types']),
    );
  }

  String toJson() => json.encode(toMap());

  factory NunType.fromJson(String source) => NunType.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NunType(id: $id, title: $title, titleAr: $titleAr, desc: $desc, letters: $letters, examples: $examples, types: $types)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is NunType &&
      other.id == id &&
      other.title == title &&
      other.titleAr == titleAr &&
      other.desc == desc &&
      listEquals(other.letters, letters) &&
      listEquals(other.examples, examples) &&
      listEquals(other.types, types);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      titleAr.hashCode ^
      desc.hashCode ^
      letters.hashCode ^
      examples.hashCode ^
      types.hashCode;
  }
}
