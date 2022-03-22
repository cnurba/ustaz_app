import 'dart:convert';

class NamazPray {
  final String title;
  final String prayAr;
  final String prayKg;
  final String prayTranscription;
  final String trackUrl;
  NamazPray({
    required this.title,
    required this.prayAr,
    required this.prayKg,
    required this.prayTranscription,
    required this.trackUrl,
  });

  NamazPray copyWith({
    String? title,
    String? prayAr,
    String? prayKg,
    String? prayTranscription,
    String? trackUrl,
  }) {
    return NamazPray(
      title: title ?? this.title,
      prayAr: prayAr ?? this.prayAr,
      prayKg: prayKg ?? this.prayKg,
      prayTranscription: prayTranscription ?? this.prayTranscription,
      trackUrl: trackUrl ?? this.trackUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'prayAr': prayAr,
      'prayKg': prayKg,
      'prayTranscription': prayTranscription,
      'trackUrl': trackUrl,
    };
  }

  factory NamazPray.fromMap(Map<String, dynamic> map) {
    return NamazPray(
      title: map['title'] ?? '',
      prayAr: map['prayAr'] ?? '',
      prayKg: map['prayKg'] ?? '',
      prayTranscription: map['prayTranscription'] ?? '',
      trackUrl: map['trackUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NamazPray.fromJson(String source) => NamazPray.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NamazPray(title: $title, prayAr: $prayAr, prayKg: $prayKg, prayTranscription: $prayTranscription, trackUrl: $trackUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is NamazPray &&
      other.title == title &&
      other.prayAr == prayAr &&
      other.prayKg == prayKg &&
      other.prayTranscription == prayTranscription &&
      other.trackUrl == trackUrl;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      prayAr.hashCode ^
      prayKg.hashCode ^
      prayTranscription.hashCode ^
      trackUrl.hashCode;
  }
}
