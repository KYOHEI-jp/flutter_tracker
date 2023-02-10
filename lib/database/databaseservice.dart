import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final dbname = "data.db";
  static final dbversion = 1;

  // テーブルの名前
  static final tablename = "activities";

  // カラムの中身
  static final columnid = "columnid";
  static final type = "type";
  static final data = "data";
  static final date = "date";

  //シングルトンクラス
  DatabaseService._privateConstructor();

  static final DatabaseService instance = DatabaseService._privateConstructor();

  // イニシャライズ
  static Database? database;

  /// データベースオブジェクトの取得
  Future<Database?> get db async {
    if (database != null) {
      return database;
    }

    database = await initializeDatabase();
    return database;
  }

  /// データベースのイニシャライズ
  initializeDatabase() async {
    // アプリケーション専用のファイルを配置するディレクトリへのパスを返す
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbname);

    // データベースに接続
    return await openDatabase(path, version: dbversion, onCreate: createTable);
  }

  /// テーブル作成
  createTable(Database db, int version) {
    db.execute('''
      CREATE TABLE $tablename(
      $columnid INTEGER PRIMARY KEY,
      $type TEXT NOT NULL,
      $data REAL NOT NULL,
      $date TEXT NOT NULL
      )
      ''');
    print("created table");
  }

  Future<int?> addActivity(Map<String, dynamic> row) async {
    Database? db = await instance.db;
    return await db?.insert(tablename, row);
  }


  Future<List<Map<String, Object?>>?> getActivities(String category) async {
    Database? db = await instance.db;
    if (category == "All") {
      return await db?.rawQuery('SELECT * FROM activities');
    } else {
      return await db?.rawQuery('SELECT * FROM activities WHERE type=?',
          ['${category.toLowerCase()}']);
    }
  }
}
