import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:muslim_app/couch/core/domain/models/namaz/namaz_step.dart';

class Namaz {
  final String name;
  final String imageUrl;
  final List<NamazStep> steps;
  Namaz({
    required this.name,
    required this.imageUrl,
    required this.steps,
  });

  Namaz copyWith({
    String? name,
    String? imageUrl,
    List<NamazStep>? steps,
  }) {
    return Namaz(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      steps: steps ?? this.steps,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'steps': steps.map((x) => x.toMap()).toList(),
    };
  }

  factory Namaz.fromMap(Map<String, dynamic> map) {
    return Namaz(
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      steps: List<NamazStep>.from(map['steps']?.map((x) => NamazStep.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Namaz.fromJson(String source) => Namaz.fromMap(json.decode(source));

  @override
  String toString() => 'Namaz(name: $name, imageUrl: $imageUrl, steps: $steps)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Namaz &&
      other.name == name &&
      other.imageUrl == imageUrl &&
      listEquals(other.steps, steps);
  }

  @override
  int get hashCode => name.hashCode ^ imageUrl.hashCode ^ steps.hashCode;
}
