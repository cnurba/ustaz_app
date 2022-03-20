import 'dart:convert';

import 'package:flutter/foundation.dart';

class Kalkala {
  final String title;
  final String desc;
  final List<String> examples;
  final List<String> letters;

  Kalkala({
    required this.title,
    required this.desc,
    required this.examples,
    required this.letters,
    types,
  });

  get types => null;
  Kalkala copyWith({
    String? title,
    String? desc,
    List<String>? examples,
    List<String>? types,
  }) {
    return Kalkala(
      title: title ?? this.title,
      desc: desc ?? this.desc,
      examples: examples ?? this.examples,
      types: types ?? this.types,
      letters: [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'desc': desc,
      'examples': examples,
      'types': types,
    };
  }

  factory Kalkala.fromMap(Map<String, dynamic> map) {
    return Kalkala(
      title: map['title'] ?? '',
      desc: map['desc'] ?? '',
      examples: List<String>.from(['examples']),
      types: List<String>.from(['types']),
      letters: [],
    );
  }

  String toJson() => json.encode(toMap());

  factory Kalkala.fromJson(String source) =>
      Kalkala.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Mim(title: $title, desc: $desc, exampies:$examples, types: $types)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Kalkala &&
        other.title == title &&
        other.desc == desc &&
        listEquals(other.examples, examples) &&
        listEquals(other.types, types);
  }

  @override
  int get hashCode {
    return title.hashCode ^ desc.hashCode ^ examples.hashCode ^ types.hashCode;
  }

  factory Kalkala.empty() => Kalkala(
        title: '',
        desc: '',
        examples: [],
        letters: [],
      );
}
