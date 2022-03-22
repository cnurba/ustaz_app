import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:muslim_app/couch/core/domain/models/namaz/namaz_pray.dart';

class NamazStep {
  final String imageUrl;
  final int rakat;
  final int step;
  final String title;
  final List<NamazPray> prays;
  NamazStep({
    required this.imageUrl,
    required this.rakat,
    required this.step,
    required this.title,
    required this.prays,
  });

  NamazStep copyWith({
    String? imageUrl,
    int? rakat,
    int? step,
    String? description,
    List<NamazPray>? prays,
  }) {
    return NamazStep(
      imageUrl: imageUrl ?? this.imageUrl,
      rakat: rakat ?? this.rakat,
      step: step ?? this.step,
      title: description ?? this.title,
      prays: prays ?? this.prays,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'rakat': rakat,
      'step': step,
      'description': title,
      'prays': prays.map((x) => x.toMap()).toList(),
    };
  }

  factory NamazStep.fromMap(Map<String, dynamic> map) {
    return NamazStep(
      imageUrl: map['imageUrl'] ?? '',
      rakat: map['rakat']?.toInt() ?? 0,
      step: map['step']?.toInt() ?? 0,
      title: map['title'] ?? '',
      prays: List<NamazPray>.from(map['prays']?.map((x) => NamazPray.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory NamazStep.fromJson(String source) => NamazStep.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NamazStep(imageUrl: $imageUrl, rakat: $rakat, step: $step, description: $title, prays: $prays)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is NamazStep &&
      other.imageUrl == imageUrl &&
      other.rakat == rakat &&
      other.step == step &&
      other.title == title &&
      listEquals(other.prays, prays);
  }

  @override
  int get hashCode {
    return imageUrl.hashCode ^
      rakat.hashCode ^
      step.hashCode ^
      title.hashCode ^
      prays.hashCode;
  }
  }
