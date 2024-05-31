import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabaseService {
  static final LocalDatabaseService instance =
      LocalDatabaseService._privateConstructor();
  static Database? _database;

  LocalDatabaseService._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'money_pig.db');

    return await openDatabase(path,
        version: 1,
        onCreate: onCreate,
        onUpgrade: onUpgrade,
        onDowngrade: onDowngrade);
  }

  Future<void> onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE pigs("
        "id TEXT PRIMARY KEY, "
        "name TEXT, "
        "style TEXT, "
        "updated_at TEXT, "
        "created_at TEXT, "
        "user_id TEXT, "
        "status TEXT)");

    await db.execute("CREATE TABLE periods("
        "id TEXT PRIMARY KEY, "
        "start_date TEXT, "
        "end_date TEXT, "
        "updated_at TEXT, "
        "created_at TEXT, "
        "status TEXT, "
        "pig_id TEXT, "
        "FOREIGN KEY (pig_id) REFERENCES pigs(id))");

    await db.execute("CREATE TABLE categories ("
        "id TEXT PRIMARY KEY, "
        "type TEXT, "
        "code TEXT, "
        "name TEXT, "
        "updated_at TEXT, "
        "created_at TEXT) ");

    await db.execute("CREATE TABLE transactions ("
        "id TEXT PRIMARY KEY, "
        "amount REAL, "
        "type TEXT, "
        "period_id TEXT, "
        "category_id TEXT, "
        "date TEXT, "
        "updated_at TEXT, "
        "created_at TEXT, "
        "status TEXT, "
        "note TEXT, "
        "FOREIGN KEY (period_id) REFERENCES periods(id), "
        "FOREIGN KEY (category_id) REFERENCES categories(id)"
        ")");
  }

  Future<void> onUpgrade(Database db, int version, int version2) async {
    onCreate(db, version);
  }

  Future<void> onDowngrade(Database db, int version, int version2) async {
    log('drop');
    // await db.execute('DROP TABLE IF EXISTS pigs');
    // await db.execute('DROP TABLE IF EXISTS transactions');
    // await db.execute('DROP TABLE IF EXISTS periods');
    // await db.execute('DROP TABLE IF EXISTS categories');

    // Loop through the tables and drop each one
  }
}
