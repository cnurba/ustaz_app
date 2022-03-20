import 'dart:convert';

class Dua {
  final String name;
  final String originalText;
  final String translatedText;
  final String transcriptionText;
  Dua({
    required this.name,
    required this.originalText,
    required this.translatedText,
    required this.transcriptionText,
  });

  Dua copyWith({
    String? name,
    String? originalText,
    String? translatedText,
    String? transcriptionText,
  }) {
    return Dua(
      name: name ?? this.name,
      originalText: originalText ?? this.originalText,
      translatedText: translatedText ?? this.translatedText,
      transcriptionText: transcriptionText ?? this.transcriptionText,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'originalText': originalText,
      'translatedText': translatedText,
      'transcriptionText': transcriptionText,
    };
  }

  factory Dua.fromMap(Map<String, dynamic> map) {
    return Dua(
      name: map['name'] ?? '',
      originalText: map['originalText'] ?? '',
      translatedText: map['translatedText'] ?? '',
      transcriptionText: map['transcriptionText'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Dua.fromJson(String source) => Dua.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Dua(name: $name, originalText: $originalText, translatedText: $translatedText, transcriptionText: $transcriptionText)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Dua &&
      other.name == name &&
      other.originalText == originalText &&
      other.translatedText == translatedText &&
      other.transcriptionText == transcriptionText;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      originalText.hashCode ^
      translatedText.hashCode ^
      transcriptionText.hashCode;
  }
}
