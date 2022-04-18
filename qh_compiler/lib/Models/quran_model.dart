class Quran {
  final String sid;
  final String aid;
  final String ayat;
  final String stopwords;

  Quran(
      {required this.sid,
      required this.aid,
      required this.ayat,
      required this.stopwords});

  factory Quran.fromMap(Map<String, dynamic> json) => Quran(
      sid: json['sid'],
      aid: json['aid'],
      ayat: json['ayat'],
      stopwords: json['stopwords']);

  Map<String, dynamic> toMap() {
    return {
      'sid': sid,
      'aid': aid,
      'ayat': ayat,
      'stopwords': stopwords,
    };
  }
}
