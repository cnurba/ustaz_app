import 'dart:convert';

import 'package:flutter/foundation.dart';

class MimType {
  final String title;
  final String desc;
  final List<String> exempler;
  final List<String> letters;
  MimType({
    required this.title,
    required this.desc,
    required this.exempler,
    required this.letters,
  });
  MimType copyWith({
    String? title,
    String? desc,
    List<String>? letters,
    List<String>? examples,
  }) {
    return MimType(
      title: title ?? this.title,
      desc: desc ?? this.desc,
      exempler: examples ?? this.exempler,
      letters: letters ?? this.letters,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'desc': desc,
      'exemplers': exempler,
      'letters': letters,
    };
  }

  factory MimType.fromMap(Map<String, dynamic> map) {
    return MimType(
      title: map['title'] ?? '',
      desc: map['desc'] ?? '',
      exempler: List<String>.from(['elements']),
      letters: List<String>.from(map['letters']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MimType.fromJson(String source) =>
      MimType.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Mim( title: $title,  desc: $desc, elements: $exempler, letters: $letters, )';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MimType &&
        other.title == title &&
        other.desc == desc &&
        listEquals(other.exempler, exempler) &&
        listEquals(other.letters, letters);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        desc.hashCode ^
        exempler.hashCode ^
        letters.hashCode;
  }

  static from(map) {}
}
