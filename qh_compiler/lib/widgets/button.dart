import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qh_compiler/Screens/Bible/bible_menu.dart';
import 'package:qh_compiler/Screens/Bible/bible_screen.dart';
import 'package:qh_compiler/Screens/Hadees/hadees_menu.dart';
import 'package:qh_compiler/Screens/Hadees/hadees_screen.dart';
import 'package:qh_compiler/Screens/Quran/quran_menu.dart';
import 'package:qh_compiler/Screens/Quran/quran_screen.dart';
import 'package:qh_compiler/Screens/menu/browse.dart';
import 'package:qh_compiler/Screens/menu/search_index.dart';
import 'package:qh_compiler/Screens/menu/synonym.dart';

Widget HomeButton(context, title) {
  return GestureDetector(
    onTap: () {
      switch (title) {
        case 'QURAN':
          Get.to(const QuranIndex());
          break;
        case 'HADITH':
          Get.to(()=>const HadeesMenu());
          break;
        case 'BIBLE':
          Get.to(()=> const BibleMenu());
          break;
        case 'SYNONYMS':
          Get.to(()=>const Synonym());
          break;
        case 'SEARCH INDEXES':
          Get.to(()=>const Browse());
          break;
        case 'SEARCH':
          Get.to(()=> SearchIndex());
          break;
      }
    },
    child: Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width - 180,
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.deepPurpleAccent[100]),
      child: Text(
        title.toString(),
        style: const TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}
