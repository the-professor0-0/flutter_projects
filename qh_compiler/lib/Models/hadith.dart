class Hadith {
  final String? jidlNo;
  final String? hadeesNo;
  final String? narrated;
  final String? hadith;

  Hadith(
      { this.jidlNo,
        this.hadeesNo,
        this.narrated,
        this.hadith,
      });

  factory Hadith.fromMap(Map<String, dynamic> json) => Hadith(
    jidlNo: json['jidlNo'],
    hadeesNo: json['hadeesNo'],
    narrated: json['narrated'],
    hadith: json['hadith'],

  );

  Map<String, dynamic> toMap() {
    return {
      'jidlNo': jidlNo,
      'hadeesNo': hadeesNo,
      'narrated': narrated,
      'hadith': hadith,
    };
  }
}
