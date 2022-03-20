import 'dart:convert';

class Zikr {
  final String name;
  final String nameKg;
  final String nameAr;
  Zikr({
    required this.name,
    required this.nameKg,
    required this.nameAr,
  });

  Zikr copyWith({
    String? name,
    String? nameKg,
    String? nameAr,
  }) {
    return Zikr(
      name: name ?? this.name,
      nameKg: nameKg ?? this.nameKg,
      nameAr: nameAr ?? this.nameAr,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'nameKg': nameKg,
      'nameAr': nameAr,
    };
  }

  factory Zikr.fromMap(Map<String, dynamic> map) {
    return Zikr(
      name: map['name'] ?? '',
      nameKg: map['nameKg'] ?? '',
      nameAr: map['nameAr'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Zikr.fromJson(String source) => Zikr.fromMap(json.decode(source));

  @override
  String toString() => 'Zikr(name: $name, nameKg: $nameKg, nameAr: $nameAr)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Zikr &&
      other.name == name &&
      other.nameKg == nameKg &&
      other.nameAr == nameAr;
  }

  @override
  int get hashCode => name.hashCode ^ nameKg.hashCode ^ nameAr.hashCode;
}
