import 'package:flutter/services.dart';

Future readFile() async {
  try {
    var sid, surah, aid, ayat = '';
    print('readingfile');
    final contents = await rootBundle.loadString('asset/quranPickthal.TXT');
    List<String> data = contents.split('\n');
    for (int i = 0; i < data.length; i++) {
      var verse = data[i];
      var a = verse.split('.');
      // print(a.length);

      if (a.length > 1) {
        for (var y = 0; y < a.length; y++) {
          if (a[y].length > 1) {
            //print('l:${a[y].length}');
            //print(a[0]);
            sid = a[0];
            surah = a[1].split(' ');
            if (surah.length > 1) {
              for (var z = 0; z < surah.length; z++) {
                if (surah[z].length > 1) {
                  aid = surah[0];
                  if (z != 0) {
                    ayat += surah[z];
                  }
                }
              }

              print('sid: ${sid}  aid:${aid} ayat:${ayat} ');

              ayat = '';
            }
          }
        }
      }
    }
  } catch (e) {
    // If encountering an error, return 0
    print('e' + e.toString());
  }
}
