import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseService {
  static final dbname = "data.db";
  static final dbversion = 1;

  //シングルトンクラス
  DatabaseService._privateConstructor();

  static final DatabaseService instance = DatabaseService._privateConstructor();

  // イニシャライズ
  static Database? database;

  Future<Database?> get db async {
    if (database != null) {
      return database;
    }

    database = await initializeDatabase();
    return database;
  }

  initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbname);
  }
}
