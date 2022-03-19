
import 'dart:convert';



class Idgam {
  final int id;
  final String title;
  final String titleAr;
  final String desc;
  final List<String> letters;
  Idgam({
    required this.id,
    required this.title,
    required this.titleAr,
    required this.desc,
    required this.letters,
  });
  
  factory Idgam.empty() => Idgam(
        id: 0,
        title: '',
        titleAr: '',
        desc: '',
        letters: [],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'titleAr': titleAr,
      'desc': desc,
      'letters': letters,
    };
  }

  factory Idgam.fromMap(Map<String, dynamic> map) {
    return Idgam(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      titleAr: map['titleAr'] ?? '',
      desc: map['desc'] ?? '',
      letters: List<String>.from(map['letters']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Idgam.fromJson(String source) => Idgam.fromMap(json.decode(source));
}

