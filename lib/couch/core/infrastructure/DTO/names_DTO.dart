


import 'package:muslim_app/couch/core/domain/models/name/names.dart';

class NamesDTO {
  final String nameRu;
  final String nameAr;
  final String description;

  const NamesDTO({
    required this.nameRu,
    required this.nameAr,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'nameRu': nameRu,
      'nameAr': nameAr,
      'description': description,
    };
  }

  factory NamesDTO.fromMap(Map<String, dynamic> map) {
    return NamesDTO(
      nameRu: map['nameRu'] ?? '',
      nameAr: map['nameAr'] ?? '',
      description: map['description'] ?? '',
    );
  }

    
  Names toDomain () => Names(nameRu: nameRu, nameAr: nameAr, description: description); 

}
