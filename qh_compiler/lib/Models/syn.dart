class Syn {
  final String? word;
  final String? syn1;
  final String? syn2;
  final String? syn3;
  final String? syn4;

  Syn(
      {required this.word,
        required this.syn1,
        required this.syn2,
        required this.syn3,
        required this.syn4});

  factory Syn.fromMap(Map<String, dynamic> json) => Syn(
      word: json['word'],
      syn1: json['syn1'],
      syn2: json['syn2'],
      syn3: json['syn3'],
      syn4: json['syn4']
  );

  Map<String, dynamic> toMap() {
    return {
      'word': word,
      'syn1': syn1,
      'syn2': syn2,
      'syn3': syn3,
      'syn4': syn4,
    };
  }
}