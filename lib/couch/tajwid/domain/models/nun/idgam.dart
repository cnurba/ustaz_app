
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Qunna {
  final int id;
  final String title;
  final String titleAr;
  final String desc;
  final List<String> letters;
  Qunna({
    required this.id,
    required this.title,
    required this.titleAr,
    required this.desc,
    required this.letters,
  });
   Qunna copyWith({
    int? id,
    String? title,
    String? titleAr,
    String? desc,
    List<String>? letters,
  }) {
    return Qunna(
      id: id ?? this.id,
      title: title ?? this.title,
      titleAr: titleAr ?? this.titleAr,
      desc: desc ?? this.desc,
      letters: letters ?? this.letters,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'titleAr': titleAr,
      'desc': desc,
      'letters': letters,
    };
  }

  factory Qunna.fromMap(Map<String, dynamic> map) {
    return Qunna(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      titleAr: map['titleAr'] ?? '',
      desc: map['desc'] ?? '',
      letters: List<String>.from(['letters']),    );
  }

  String toJson() => json.encode(toMap());

  factory Qunna.fromJson(String source) => Qunna.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Nun(id: $id, title: $title, titleAr: $titleAr, desc: $desc, letters: $letters)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Qunna &&
        other.id == id &&
        other.title == title &&
        other.titleAr == titleAr &&
        other.desc == desc &&
        listEquals(other.letters, letters);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        titleAr.hashCode ^
        desc.hashCode ^
        letters.hashCode;
  }

  factory Qunna.empty() => Qunna(
        id: 0,
        title: '',
        titleAr: '',
        desc: '',
        letters: [],
      );
}

