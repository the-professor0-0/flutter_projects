import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qh_compiler/Models/hadith.dart';
import 'package:qh_compiler/Models/quran_model.dart';
import 'package:qh_compiler/Models/syn.dart';
import 'package:qh_compiler/Screens/Bible/bible_menu.dart';
import 'dart:io';

import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'quran.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE quran(
          sid TEXT,
          aid TEXT,
          ayat TEXT,
          stopwords TEXT
      )
      ''');
    await db.execute('''
      CREATE TABLE bible(
          sid TEXT,
          aid TEXT,
          ayat TEXT,
          stopwords TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE hadees(
          jidlNo TEXT,
          hadeesNo TEXT,
          narrated TEXT,
          hadith TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE synonym(
          word TEXT,
          syn1 TEXT,
          syn2 TEXT,
          syn3 TEXT,
          syn4 TEXT
      )
    ''');
  }

  Future<List<Quran>> getQuran(id) async {
    Database db = await instance.database;
    var quran = await db.rawQuery("Select * from quran where sid='"+id.toString()+"'");
    List<Quran> groceryList =
        quran.isNotEmpty ? quran.map((c) => Quran.fromMap(c)).toList() : [];
    return groceryList;
  }

  Future<List<Hadith>> getHadees(id) async {
    Database db = await instance.database;
    var hadees = await db.rawQuery("Select * from hadees where jidlNo='"+id.toString()+"'");
    List<Hadith> groceryList =
    hadees.isNotEmpty ? hadees.map((c) => Hadith.fromMap(c)).toList() : [];
    return groceryList;
  }

  Future<List<Quran>> getBible(id) async {
    Database db = await instance.database;
    var quran = await db.rawQuery("Select * from bible where sid='"+id.toString()+"'");
    List<Quran> groceryList =
    quran.isNotEmpty ? quran.map((c) => Quran.fromMap(c)).toList() : [];
    return groceryList;
  }

  Future<List<Syn>> getSyn() async {
    Database db = await instance.database;
    var quran = await db.rawQuery("Select * from synonym");
    List<Syn> groceryList =
    quran.isNotEmpty ? quran.map((c) => Syn.fromMap(c)).toList() : [];
    return groceryList;
  }


  Future<int> addQuran(Quran quran) async {
    Database db = await instance.database;
    return await db.insert('quran', quran.toMap());
  }

  Future<int> addBible(Quran quran) async {
    Database db = await instance.database;
    return await db.insert('bible', quran.toMap());
  }

  Future<int> addHadees(Hadith quran) async {
    Database db = await instance.database;
    return await db.insert('hadees', quran.toMap());
  }

  Future<int> addSynonym(Syn quran) async {
    Database db = await instance.database;
    return await db.insert('synonym', quran.toMap());
  }

  Future<List<Quran>> searchIndexQuran(ind) async {
    Database db = await instance.database;
    var syns2 = await db.rawQuery("Select * from synonym where word = '"+ind+"' or syn1 = '"+ind+"' or syn2 = '"+ind+"' or syn3 ='"+ind+"' or syn4 = '"+ind+"' ");
    var syns = await db.rawQuery("Select * from quran where ayat like '%"+syns2[0]['word'].toString()+"%' or ayat like '%"+syns2[0]['syn1'].toString()+"%' or ayat like '%"+syns2[0]['syn2'].toString()+"%' or ayat like '%"+syns2[0]['syn3'].toString()+"%' or ayat like '%"+syns2[0]['syn4'].toString()+"%'");
    List<Quran> groceryList =
    syns.isNotEmpty ? syns.map((c) => Quran.fromMap(c)).toList() : [];
    return groceryList;
  }

  Future<List<Hadith>> searchIndexHadith(ind) async {
    Database db = await instance.database;
    var syns2 = await db.rawQuery("Select * from synonym where word = '"+ind+"' or syn1 = '"+ind+"' or syn2 = '"+ind+"' or syn3 ='"+ind+"' or syn4 = '"+ind+"' ");
    var syns = await db.rawQuery("Select * from hadees where hadith like '%"+syns2[0]['word'].toString()+"%' or hadith like '%"+syns2[0]['syn1'].toString()+"%' or hadith like '%"+syns2[0]['syn2'].toString()+"%' or hadith like '%"+syns2[0]['syn3'].toString()+"%' or hadith like '%"+syns2[0]['syn4'].toString()+"%'");
    List<Hadith> groceryList =
    syns.isNotEmpty ? syns.map((c) => Hadith.fromMap(c)).toList() : [];
    return groceryList;
  }

  Future<List<Quran>> searchIndexBible(ind) async {
    Database db = await instance.database;
    var syns2 = await db.rawQuery("Select * from synonym where word = '"+ind+"' or syn1 = '"+ind+"' or syn2 = '"+ind+"' or syn3 ='"+ind+"' or syn4 = '"+ind+"' ");
    var syns = await db.rawQuery("Select * from bible where ayat like '%"+syns2[0]['word'].toString()+"%' or ayat like '%"+syns2[0]['syn1'].toString()+"%' or ayat like '%"+syns2[0]['syn2'].toString()+"%' or ayat like '%"+syns2[0]['syn3'].toString()+"%' or ayat like '%"+syns2[0]['syn4'].toString()+"%'");
    List<Quran> groceryList =
    syns.isNotEmpty ? syns.map((c) => Quran.fromMap(c)).toList() : [];
    return groceryList;
  }


// Future<int> remove(int id) async {
  //   Database db = await instance.database;
  //   return await db.delete('quran', where: 'id = ?', whereArgs: [id]);
  // }
  //
  // Future<int> update(Quran grocery) async {
  //   Database db = await instance.database;
  //   return await db.update('groceries', grocery.toMap(),
  //       where: "id = ?", whereArgs: [grocery.aid]);
  // }
}