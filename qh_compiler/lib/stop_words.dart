import 'package:flutter/services.dart';
import 'package:qh_compiler/Models/hadith.dart';
import 'package:qh_compiler/Models/syn.dart';

import 'Models/quran_model.dart';
import 'dbHelpers/db_helper.dart';

class Constants {
  static List<String> x = [];
  static var n = '';

  static readQuran() async {
    try {
      final contents = await rootBundle.loadString('assets/quran.txt');
      List<String> data = contents.split('\n');
      var x;
      var str = '';
      for (int i = 0; Constants.verse.length != 100; i++) {
        x = data[i].toString();
        if (x.length.toString() != '1') {
          if (RegExp('[0-9]').hasMatch(x)) {
            Constants.surahNo.add(x.toString().split(".")[0].toString());
            Constants.ayatNo.add(
                x.toString().split(".")[1].toString().split(' ')[0].toString());
          }
          str +=
              x.toString().replaceAll(RegExp('[0-9]'), '').replaceAll('.', '');
        } else {
          Constants.verse.add(str);
          str = '';
        }
      }
    } catch (e) {
      print('e' + e.toString());
    }
  }

  static removeStopWordsQuran() async {
    await readQuran();
    for (int k = 0; k < Constants.verse.length; k++) {
      x = Constants.verse[k]
          .toString()
          .toUpperCase()
          .replaceAll('"', '')
          .replaceAll('.', '')
          .replaceAll(',', '')
          .replaceAll('  ', '')
          .replaceAll(RegExp('  '), '')
          .split(' ');

      for (int i = 0; i < x.length; i++) {
        for (int j = 0; j < x[i].length; j++) {
          if (x[i][j].toString().toLowerCase() == 'a' ||
              x[i][j].toString().toLowerCase() == 'b' ||
              x[i][j].toString().toLowerCase() == 'c' ||
              x[i][j].toString().toLowerCase() == 'd' ||
              x[i][j].toString().toLowerCase() == 'e' ||
              x[i][j].toString().toLowerCase() == 'f' ||
              x[i][j].toString().toLowerCase() == 'g' ||
              x[i][j].toString().toLowerCase() == 'h' ||
              x[i][j].toString().toLowerCase() == 'i' ||
              x[i][j].toString().toLowerCase() == 'j' ||
              x[i][j].toString().toLowerCase() == 'k' ||
              x[i][j].toString().toLowerCase() == 'l' ||
              x[i][j].toString().toLowerCase() == 'm' ||
              x[i][j].toString().toLowerCase() == 'n' ||
              x[i][j].toString().toLowerCase() == 'o' ||
              x[i][j].toString().toLowerCase() == 'p' ||
              x[i][j].toString().toLowerCase() == 'q' ||
              x[i][j].toString().toLowerCase() == 'r' ||
              x[i][j].toString().toLowerCase() == 's' ||
              x[i][j].toString().toLowerCase() == 't' ||
              x[i][j].toString().toLowerCase() == 'u' ||
              x[i][j].toString().toLowerCase() == 'v' ||
              x[i][j].toString().toLowerCase() == 'w' ||
              x[i][j].toString().toLowerCase() == 'x' ||
              x[i][j].toString().toLowerCase() == 'y' ||
              x[i][j].toString().toLowerCase() == 'z' ||
              x[i][j].toString().toLowerCase() == "'" ||
              x[i][j].toString().toLowerCase() == '(' ||
              x[i][j].toString().toLowerCase() == ')') {
            n += x[i][j].toString();
          } else {
            n += ' ';
          }
        }
        n += ' ';
      }
      x = n.split(' ');
      for (int i = 0; i < Constants.stopwords.length; i++) {
        while (x.contains(Constants.stopwords[i].toUpperCase())) {
          x.remove(Constants.stopwords[i].toUpperCase());
        }
      }
      n = '';
      for (int i = 0; i < x.length; i++) {
        n += x[i] + ' ';
      }
      Constants.stopWordsQuran.add(n);
      n = '';
    }
  }

  static addQuranDB() async {
    await removeStopWordsQuran();
    for (int i = 0; i < Constants.verse.length; i++) {
      try {
        await DatabaseHelper.instance.addQuran(Quran(
            aid: Constants.ayatNo[i],
            sid: Constants.surahNo[i],
            ayat: Constants.verse[i],
            stopwords: Constants.stopWordsQuran[i]));
        print("QURAN CALLED : " + i.toString());
      } catch (e) {
        await DatabaseHelper.instance.addQuran(Quran(
            aid: Constants.ayatNo[i],
            sid: Constants.surahNo[i],
            ayat: "",
            stopwords: ""));
        print("Exceptionnnnnnnnnnnnnnn Quran : " + e.toString());
      }
    }
    print('Completed');
  }

  static readBible() async {
    final contents = await rootBundle.loadString('assets/bible.txt');
    List<String> data = contents.split('\n');
    var x;
    try {
      var str = '';
      for (int i = 0; Constants.bibleVerse.length != 100; i++) {
        x = data[i].toString();
        if (x.length.toString() != '1') {
          if (RegExp('[0-9]:[0-9]').hasMatch(x)) {
            Constants.bibleSurahNo.add(x.toString().split(":")[0]);
            Constants.bibleAyatNo.add(
                x.toString().split(":")[1].toString().split(' ')[0].toString());
          }
          str +=
              x.toString().replaceAll(RegExp('[0-9]'), '').replaceAll(':', '');
        } else {
          Constants.bibleVerse.add(str);
          str = '';
        }
      }
    } catch (e) {
      print('e' + e.toString() + x.toString());
    }
  }

  static removeStopWordsBible() async {
    await readBible();
    for (int k = 0; k < Constants.bibleVerse.length; k++) {
      x = Constants.bibleVerse[k]
          .toString()
          .toUpperCase()
          .replaceAll('"', '')
          .replaceAll('.', '')
          .replaceAll(',', '')
          .replaceAll('  ', '')
          .replaceAll(RegExp('  '), '')
          .split(' ');

      for (int i = 0; i < x.length; i++) {
        for (int j = 0; j < x[i].length; j++) {
          if (x[i][j].toString().toLowerCase() == 'a' ||
              x[i][j].toString().toLowerCase() == 'b' ||
              x[i][j].toString().toLowerCase() == 'c' ||
              x[i][j].toString().toLowerCase() == 'd' ||
              x[i][j].toString().toLowerCase() == 'e' ||
              x[i][j].toString().toLowerCase() == 'f' ||
              x[i][j].toString().toLowerCase() == 'g' ||
              x[i][j].toString().toLowerCase() == 'h' ||
              x[i][j].toString().toLowerCase() == 'i' ||
              x[i][j].toString().toLowerCase() == 'j' ||
              x[i][j].toString().toLowerCase() == 'k' ||
              x[i][j].toString().toLowerCase() == 'l' ||
              x[i][j].toString().toLowerCase() == 'm' ||
              x[i][j].toString().toLowerCase() == 'n' ||
              x[i][j].toString().toLowerCase() == 'o' ||
              x[i][j].toString().toLowerCase() == 'p' ||
              x[i][j].toString().toLowerCase() == 'q' ||
              x[i][j].toString().toLowerCase() == 'r' ||
              x[i][j].toString().toLowerCase() == 's' ||
              x[i][j].toString().toLowerCase() == 't' ||
              x[i][j].toString().toLowerCase() == 'u' ||
              x[i][j].toString().toLowerCase() == 'v' ||
              x[i][j].toString().toLowerCase() == 'w' ||
              x[i][j].toString().toLowerCase() == 'x' ||
              x[i][j].toString().toLowerCase() == 'y' ||
              x[i][j].toString().toLowerCase() == 'z' ||
              x[i][j].toString().toLowerCase() == "'" ||
              x[i][j].toString().toLowerCase() == '(' ||
              x[i][j].toString().toLowerCase() == ')') {
            n += x[i][j].toString();
          } else {
            n += ' ';
          }
        }
        n += ' ';
      }
      x = n.split(' ');
      for (int i = 0; i < Constants.stopwords.length; i++) {
        while (x.contains(Constants.stopwords[i].toUpperCase())) {
          x.remove(Constants.stopwords[i].toUpperCase());
        }
      }
      n = '';
      for (int i = 0; i < x.length; i++) {
        n += x[i] + ' ';
      }
      Constants.stopWordsBible.add(n);
      n = '';
    }
  }

  static addBibleDB() async {
    await removeStopWordsBible();
    for (int i = 0; i < Constants.bibleVerse.length; i++) {
      try {
        await DatabaseHelper.instance.addBible(Quran(
            aid: Constants.bibleAyatNo[i],
            sid: Constants.bibleSurahNo[i],
            ayat: Constants.bibleVerse[i],
            stopwords: Constants.stopWordsBible[i]));
        print('BIBLE Called : ' + i.toString());
      } catch (e) {
        await DatabaseHelper.instance.addBible(Quran(
            aid: Constants.bibleAyatNo[i],
            sid: Constants.bibleSurahNo[i],
            ayat: "",
            stopwords: ""));
        print("EXCEPPPPPPPTIONNNNNNNNNN BIBLE : " + e.toString());
      }
    }
  }

  static readHadees() async {
    print("called");
    final contents = await rootBundle.loadString('assets/hadees.txt');
    List<String> newFile = contents.split('\n');
    var str = '';
    var x;
    for (int index = 0; Constants.hadeesData.length != 100; index++) {
      try {
        x = newFile[index];
        if (x.length.toString() != '1') {
          if (RegExp('[0-9]').hasMatch(x) &&
              x.contains(":") &&
              (x.contains(".  ") ||
                  x.contains(". ") ||
                  RegExp('[0-9].[0-9]').hasMatch(x))) {
            var n = x.toString().replaceAll(":", '').split('.');
            Constants.jildno.add(n[0]);
            Constants.hadeesno.add(n[1]);
            if (str.toString() != '') {
              Constants.hadeesData.add(str);
              str = '';
            }
          } else {
            if (x.toLowerCase().contains("narrated")) {
              Constants.narrated.add(x);
            } else {
              str += x;
            }
          }
        }
      } catch (e) {
        print(e);
      }
    }
  }

  static removeStopWordsHadees() async {
    await readHadees();
    for (int k = 0; k < Constants.hadeesData.length; k++) {
      x = Constants.hadeesData[k]
          .toString()
          .toUpperCase()
          .replaceAll('"', '')
          .replaceAll('.', '')
          .replaceAll(',', '')
          .replaceAll('  ', '')
          .replaceAll(RegExp('  '), '')
          .split(' ');

      for (int i = 0; i < x.length; i++) {
        for (int j = 0; j < x[i].length; j++) {
          if (x[i][j].toString().toLowerCase() == 'a' ||
              x[i][j].toString().toLowerCase() == 'b' ||
              x[i][j].toString().toLowerCase() == 'c' ||
              x[i][j].toString().toLowerCase() == 'd' ||
              x[i][j].toString().toLowerCase() == 'e' ||
              x[i][j].toString().toLowerCase() == 'f' ||
              x[i][j].toString().toLowerCase() == 'g' ||
              x[i][j].toString().toLowerCase() == 'h' ||
              x[i][j].toString().toLowerCase() == 'i' ||
              x[i][j].toString().toLowerCase() == 'j' ||
              x[i][j].toString().toLowerCase() == 'k' ||
              x[i][j].toString().toLowerCase() == 'l' ||
              x[i][j].toString().toLowerCase() == 'm' ||
              x[i][j].toString().toLowerCase() == 'n' ||
              x[i][j].toString().toLowerCase() == 'o' ||
              x[i][j].toString().toLowerCase() == 'p' ||
              x[i][j].toString().toLowerCase() == 'q' ||
              x[i][j].toString().toLowerCase() == 'r' ||
              x[i][j].toString().toLowerCase() == 's' ||
              x[i][j].toString().toLowerCase() == 't' ||
              x[i][j].toString().toLowerCase() == 'u' ||
              x[i][j].toString().toLowerCase() == 'v' ||
              x[i][j].toString().toLowerCase() == 'w' ||
              x[i][j].toString().toLowerCase() == 'x' ||
              x[i][j].toString().toLowerCase() == 'y' ||
              x[i][j].toString().toLowerCase() == 'z' ||
              x[i][j].toString().toLowerCase() == "'" ||
              x[i][j].toString().toLowerCase() == '(' ||
              x[i][j].toString().toLowerCase() == ')') {
            n += x[i][j].toString();
          } else {
            n += ' ';
          }
        }
        n += ' ';
      }
      x = n.split(' ');
      for (int i = 0; i < Constants.stopwords.length; i++) {
        while (x.contains(Constants.stopwords[i].toUpperCase())) {
          x.remove(Constants.stopwords[i].toUpperCase());
        }
      }
      n = '';
      for (int i = 0; i < x.length; i++) {
        n += x[i] + ' ';
      }
      Constants.stopWordsHadees.add(n);
      n = '';
    }
  }

  static addHadeesDB() async {
    await removeStopWordsHadees();
    for (int i = 0; i < Constants.hadeesData.length; i++) {
      try {
        await DatabaseHelper.instance.addHadees(Hadith(
            hadeesNo: Constants.hadeesno[i],
            jidlNo: Constants.jildno[i],
            narrated: Constants.narrated[i],
            hadith: Constants.hadeesData[i]));
        print("HADEES CALLED : " + i.toString());
      } catch (e) {
        await DatabaseHelper.instance.addHadees(Hadith(
            hadeesNo: Constants.hadeesno[i],
            jidlNo: Constants.jildno[i],
            narrated: "",
            hadith: ""));
        print("EXCEPTIONNNNNNNNNNNNNn Hadees : " + e.toString());
      }
    }
    print('Completed CALLING EVERYTHING');
  }

  static readSynonym() async {
    synonym.clear();
    syn1.clear();
    syn2.clear();
    syn3.clear();
    try {
      final contents = await rootBundle.loadString('assets/synonyms.txt');
      List<String> data = contents.split('\n');
      var x;
      for (int i = 0; i < data.length; i++) {
        x = data[i].split(',');
        try {
          await DatabaseHelper.instance.addSynonym(Syn(
              word: x[0].toString(),
              syn1: x[1].toString(),
              syn2: x[2].toString(),
              syn3: x[3].toString(),
              syn4: x[4].toString()));
          print("Synonym CALLED : " + i.toString());
        } catch (e) {
          print("EXCEPTIONNNNNNNNNNNNNn SYN : " +
              e.toString() +
              "CALLALALA" +
              x.toString());
        }
      }
    } catch (e) {
      print('e' + e.toString());
    }
  }

  static var synonym = [];
  static var syn1 = [];
  static var syn2 = [];
  static var syn3 = [];
  static var syn4 = [];

  static var hadeesData = [];
  static var jildno = [];
  static var hadeesno = [];
  static var narrated = [];
  static var stopWordsHadees = [];

  static var surahNo = [];
  static var ayatNo = [];
  static var verse = [];
  static var stopWordsQuran = [];

  static var bibleSurahNo = [];
  static var bibleAyatNo = [];
  static var bibleVerse = [];
  static var stopWordsBible = [];

  static var indexes = [
    '001',
    '002',
    '003',
    '004',
    '005',
    '006',
    '007',
    '008',
    '009',
    '010',
    '011',
    '012',
    '013',
    '014',
    '015',
    '016',
    '017',
    '018',
    '019',
    '020',
    '021',
    '022',
    '023',
    '024',
    '025',
    '026',
    '027',
    '028',
    '029',
    '030',
    '031',
    '032',
    '033',
    '034',
    '035',
    '036',
    '037',
    '038',
    '039',
    '040',
    '041',
    '042',
    '043',
    '044',
    '045',
    '046',
    '047',
    '048',
    '049',
    '050',
    '051',
    '052',
    '053',
    '054',
    '055',
    '056',
    '057',
    '058',
    '059',
    '060',
    '061',
    '062',
    '063',
    '064',
    '065',
    '066',
    '067',
    '068',
    '069',
    '070',
    '071',
    '072',
    '073',
    '074',
    '075',
    '076',
    '077',
    '078',
    '079',
    '080',
    '081',
    '082',
    '083',
    '084',
    '085',
    '086',
    '087',
    '088',
    '089',
    '090',
    '091',
    '092',
    '093',
    '094',
    '095',
    '096',
    '097',
    '098',
    '099',
    '100',
    '101',
    '102',
    '103',
    '104',
    '105',
    '106',
    '107',
    '108',
    '109',
    '110',
    '111',
    '112',
    '113',
    '114',
  ];

  static var stopwords = [
    "able",
    "about",
    "above",
    "abroad",
    "according",
    "accordingly",
    "across",
    "actually",
    "adj",
    "after",
    "afterwards",
    "again",
    "against",
    "ago",
    "ahead",
    "ain't",
    "all",
    "allow",
    "allows",
    "almost",
    "alone",
    "along",
    "alongside",
    "already",
    "also",
    "although",
    "always",
    "am",
    "amid",
    "amidst",
    "among",
    "amongst",
    "an",
    "and",
    "another",
    "any",
    "anybody",
    "anyhow",
    "anyone",
    "anything",
    "anyway",
    "anyways",
    "anywhere",
    "apart",
    "appear",
    "appreciate",
    "appropriate",
    "are",
    "aren't",
    "around",
    "as",
    "a's",
    "aside",
    "ask",
    "asking",
    "associated",
    "at",
    "available",
    "away",
    "awfully",
    "back",
    "backward",
    "backwards",
    "be",
    "became",
    "because",
    "become",
    "becomes",
    "becoming",
    "been",
    "before",
    "beforehand",
    "begin",
    "behind",
    "being",
    "believe",
    "below",
    "beside",
    "besides",
    "best",
    "better",
    "between",
    "beyond",
    "both",
    "brief",
    "but",
    "by",
    "came",
    "can",
    "cannot",
    "cant",
    "can't",
    "caption",
    "cause",
    "causes",
    "certain",
    "certainly",
    "changes",
    "clearly",
    "c'mon",
    "co",
    "co.",
    "com",
    "come",
    "comes",
    "concerning",
    "consequently",
    "consider",
    "considering",
    "contain",
    "containing",
    "contains",
    "corresponding",
    "could",
    "couldn't",
    "course",
    "c's",
    "currently",
    "dare",
    "daren't",
    "definitely",
    "described",
    "despite",
    "did",
    "didn't",
    "different",
    "directly",
    "do",
    "does",
    "doesn't",
    "doing",
    "done",
    "don't",
    "down",
    "downwards",
    "during",
    "each",
    "edu",
    "eg",
    "eight",
    "eighty",
    "either",
    "else",
    "elsewhere",
    "end",
    "ending",
    "enough",
    "entirely",
    "especially",
    "et",
    "etc",
    "even",
    "ever",
    "evermore",
    "every",
    "everybody",
    "everyone",
    "everything",
    "everywhere",
    "ex",
    "exactly",
    "example",
    "except",
    "fairly",
    "far",
    "farther",
    "few",
    "fewer",
    "fifth",
    "first",
    "five",
    "followed",
    "following",
    "follows",
    "for",
    "forever",
    "former",
    "formerly",
    "forth",
    "forward",
    "found",
    "four",
    "from",
    "further",
    "furthermore",
    "get",
    "gets",
    "getting",
    "given",
    "gives",
    "go",
    "goes",
    "going",
    "gone",
    "got",
    "gotten",
    "greetings",
    "had",
    "hadn't",
    "half",
    "happens",
    "hardly",
    "has",
    "hasn't",
    "have",
    "haven't",
    "having",
    "he",
    "he'd",
    "he'll",
    "hello",
    "help",
    "hence",
    "her",
    "here",
    "hereafter",
    "hereby",
    "herein",
    "here's",
    "hereupon",
    "hers",
    "herself",
    "he's",
    "hi",
    "him",
    "himself",
    "his",
    "hither",
    "hopefully",
    "how",
    "howbeit",
    "however",
    "hundred",
    "i'd",
    "ie",
    "if",
    "ignored",
    "i'll",
    "i'm",
    "immediate",
    "in",
    "inasmuch",
    "inc",
    "inc.",
    "indeed",
    "indicate",
    "indicated",
    "indicates",
    "inner",
    "inside",
    "insofar",
    "instead",
    "into",
    "inward",
    "is",
    "isn't",
    "it",
    "it'd",
    "it'll",
    "its",
    "it's",
    "itself",
    "i've",
    "just",
    "k",
    "keep",
    "keeps",
    "kept",
    "know",
    "known",
    "knows",
    "last",
    "lately",
    "later",
    "latter",
    "latterly",
    "least",
    "less",
    "lest",
    "let",
    "let's",
    "like",
    "liked",
    "likely",
    "likewise",
    "little",
    "look",
    "looking",
    "looks",
    "low",
    "lower",
    "ltd",
    "made",
    "mainly",
    "make",
    "makes",
    "many",
    "may",
    "maybe",
    "mayn't",
    "me",
    "mean",
    "meantime",
    "meanwhile",
    "merely",
    "might",
    "mightn't",
    "mine",
    "minus",
    "miss",
    "more",
    "moreover",
    "most",
    "mostly",
    "mr",
    "mrs",
    "much",
    "must",
    "mustn't",
    "my",
    "myself",
    "name",
    "namely",
    "nd",
    "near",
    "nearly",
    "necessary",
    "need",
    "needn't",
    "needs",
    "neither",
    "never",
    "neverf",
    "neverless",
    "nevertheless",
    "new",
    "next",
    "nine",
    "ninety",
    "no",
    "nobody",
    "non",
    "none",
    "nonetheless",
    "noone",
    "no-one",
    "nor",
    "normally",
    "not",
    "nothing",
    "notwithstanding",
    "novel",
    "now",
    "nowhere",
    "obviously",
    "of",
    "off",
    "often",
    "oh",
    "ok",
    "okay",
    "old",
    "on",
    "once",
    "one",
    "ones",
    "one's",
    "only",
    "onto",
    "opposite",
    "or",
    "other",
    "others",
    "otherwise",
    "ought",
    "oughtn't",
    "our",
    "ours",
    "ourselves",
    "out",
    "outside",
    "over",
    "overall",
    "own",
    "particular",
    "particularly",
    "past",
    "per",
    "perhaps",
    "placed",
    "please",
    "plus",
    "possible",
    "presumably",
    "probably",
    "provided",
    "provides",
    "que",
    "quite",
    "qv",
    "rather",
    "rd",
    "re",
    "really",
    "reasonably",
    "recent",
    "recently",
    "regarding",
    "regardless",
    "regards",
    "relatively",
    "respectively",
    "right",
    "round",
    "said",
    "same",
    "saw",
    "say",
    "saying",
    "says",
    "second",
    "secondly",
    "see",
    "seeing",
    "seem",
    "seemed",
    "seeming",
    "seems",
    "seen",
    "self",
    "selves",
    "sensible",
    "sent",
    "serious",
    "seriously",
    "seven",
    "several",
    "shall",
    "shan't",
    "she",
    "she'd",
    "she'll",
    "she's",
    "should",
    "shouldn't",
    "since",
    "six",
    "so",
    "some",
    "somebody",
    "someday",
    "somehow",
    "someone",
    "something",
    "sometime",
    "sometimes",
    "somewhat",
    "somewhere",
    "soon",
    "sorry",
    "specified",
    "specify",
    "specifying",
    "still",
    "sub",
    "such",
    "sup",
    "sure",
    "take",
    "taken",
    "taking",
    "tell",
    "tends",
    "th",
    "than",
    "thank",
    "thanks",
    "thanx",
    "that",
    "that'll",
    "thats",
    "that's",
    "that've",
    "the",
    "their",
    "theirs",
    "them",
    "themselves",
    "then",
    "thence",
    "there",
    "thereafter",
    "thereby",
    "there'd",
    "therefore",
    "therein",
    "there'll",
    "there're",
    "theres",
    "there's",
    "thereupon",
    "there've",
    "these",
    "they",
    "they'd",
    "they'll",
    "they're",
    "they've",
    "thing",
    "things",
    "think",
    "third",
    "thirty",
    "this",
    "thorough",
    "thoroughly",
    "those",
    "though",
    "three",
    "through",
    "throughout",
    "thru",
    "thus",
    "till",
    "to",
    "together",
    "too",
    "took",
    "toward",
    "towards",
    "tried",
    "tries",
    "truly",
    "try",
    "trying",
    "t's",
    "twice",
    "two",
    "un",
    "under",
    "underneath",
    "undoing",
    "unfortunately",
    "unless",
    "unlike",
    "unlikely",
    "until",
    "unto",
    "up",
    "upon",
    "upwards",
    "us",
    "use",
    "used",
    "useful",
    "uses",
    "using",
    "usually",
    "v",
    "value",
    "various",
    "versus",
    "very",
    "via",
    "viz",
    "vs",
    "want",
    "wants",
    "was",
    "wasn't",
    "way",
    "we",
    "we'd",
    "welcome",
    "well",
    "we'll",
    "went",
    "were",
    "we're",
    "weren't",
    "we've",
    "what",
    "whatever",
    "what'll",
    "what's",
    "what've",
    "when",
    "whence",
    "whenever",
    "where",
    "whereafter",
    "whereas",
    "whereby",
    "wherein",
    "where's",
    "whereupon",
    "wherever",
    "whether",
    "which",
    "whichever",
    "while",
    "whilst",
    "whither",
    "who",
    "who'd",
    "whoever",
    "whole",
    "who'll",
    "whom",
    "whomever",
    "who's",
    "whose",
    "why",
    "will",
    "willing",
    "wish",
    "with",
    "within",
    "without",
    "wonder",
    "won't",
    "would",
    "wouldn't",
    "yes",
    "yet",
    "you",
    "you'd",
    "you'll",
    "your",
    "you're",
    "yours",
    "yourself",
    "yourselves",
    "you've",
    "zero",
    "a",
    "how's",
    "i",
    "when's",
    "why's",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "j",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "uucp",
    "w",
    "x",
    "y",
    "z",
    "I",
    "www",
    "amount",
    "bill",
    "bottom",
    "call",
    "computer",
    "con",
    "couldnt",
    "cry",
    "de",
    "describe",
    "detail",
    "due",
    "eleven",
    "empty",
    "fifteen",
    "fifty",
    "fill",
    "find",
    "fire",
    "forty",
    "front",
    "full",
    "give",
    "hasnt",
    "herse",
    "himse",
    "interest",
    "itse”",
    "mill",
    "move",
    "myse”",
    "part",
    "put",
    "show",
    "side",
    "sincere",
    "sixty",
    "system",
    "ten",
    "thick",
    "thin",
    "top",
    "twelve",
    "twenty",
    "abst",
    "accordance",
    "act",
    "added",
    "adopted",
    "affected",
    "affecting",
    "affects",
    "ah",
    "announce",
    "anymore",
    "apparently",
    "approximately",
    "aren",
    "arent",
    "arise",
    "auth",
    "beginning",
    "beginnings",
    "begins",
    "biol",
    "briefly",
    "ca",
    "date",
    "ed",
    "effect",
    "et-al",
    "ff",
    "fix",
    "gave",
    "giving",
    "heres",
    "hes",
    "hid",
    "home",
    "id",
    "im",
    "immediately",
    "importance",
    "important",
    "index",
    "information",
    "invention",
    "itd",
    "keys",
    "kg",
    "km",
    "largely",
    "lets",
    "line",
    "'ll",
    "means",
    "mg",
    "million",
    "ml",
    "mug",
    "na",
    "nay",
    "necessarily",
    "nos",
    "noted",
    "obtain",
    "obtained",
    "omitted",
    "ord",
    "owing",
    "page",
    "pages",
    "poorly",
    "possibly",
    "potentially",
    "pp",
    "predominantly",
    "present",
    "previously",
    "primarily",
    "promptly",
    "proud",
    "quickly",
    "ran",
    "readily",
    "ref",
    "refs",
    "related",
    "research",
    "resulted",
    "resulting",
    "results",
    "run",
    "sec",
    "section",
    "shed",
    "shes",
    "showed",
    "shown",
    "showns",
    "shows",
    "significant",
    "significantly",
    "similar",
    "similarly",
    "slightly",
    "somethan",
    "specifically",
    "state",
    "states",
    "stop",
    "strongly",
    "substantially",
    "successfully",
    "sufficiently",
    "suggest",
    "thered",
    "thereof",
    "therere",
    "thereto",
    "theyd",
    "theyre",
    "thou",
    "thoughh",
    "thousand",
    "throug",
    "til",
    "tip",
    "ts",
    "ups",
    "usefully",
    "usefulness",
    "'ve",
    "vol",
    "vols",
    "wed",
    "whats",
    "wheres",
    "whim",
    "whod",
    "whos",
    "widely",
    "words",
    "world",
    "youd",
    "youre"
  ];
}
