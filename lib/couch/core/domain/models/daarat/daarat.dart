import 'dart:convert';

class Daarat {
  final String imageUrl;
  final String description;
  Daarat({
    required this.imageUrl,
    required this.description,
  });

  Daarat copyWith({
    String? imageUrl,
    String? description,
  }) {
    return Daarat(
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'description': description,
    };
  }

  factory Daarat.fromMap(Map<String, dynamic> map) {
    return Daarat(
      imageUrl: map['imageUrl'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Daarat.fromJson(String source) => Daarat.fromMap(json.decode(source));

  @override
  String toString() => 'Daarat(imageUrl: $imageUrl, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Daarat &&
      other.imageUrl == imageUrl &&
      other.description == description;
  }

  @override
  int get hashCode => imageUrl.hashCode ^ description.hashCode;
}
