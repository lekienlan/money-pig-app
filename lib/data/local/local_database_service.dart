import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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
    String path =
        join(await getDatabasesPath(), "money_pig_${dotenv.get('ENV')}.db");

    return await openDatabase(
      path,
      version: 2,
      onCreate: onCreate,
      onUpgrade: onUpgrade,
      onDowngrade: onDowngrade,
    );
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
        "style JSON, "
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

  Future<void> onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute(
          "ALTER TABLE categories ADD COLUMN status TEXT DEFAULT 'active';");
    }

    // await db.delete('categories');

    // await db.execute("ALTER TABLE categories DROP COLUMN style");
    // await db.execute("ALTER TABLE categories ADD COLUMN style TEXT");

    // await db.execute('DROP TABLE IF EXISTS pigs');
    // await db.execute('DROP TABLE IF EXISTS transactions');
    // await db.execute('DROP TABLE IF EXISTS periods');
    // await db.execute('DROP TABLE IF EXISTS categories');
    // onCreate(db, version);
  }

  Future<void> onDowngrade(Database db, int version, int version2) async {
    log('drop');
    // await db.delete('categories');
    // await db.delete('categories');
    // await db.execute("ALTER TABLE categories DROP COLUMN style");
    // await db.execute("ALTER TABLE categories ADD COLUMN style TEXT");
    // await db.execute('DROP TABLE IF EXISTS pigs');
    // await db.execute('DROP TABLE IF EXISTS transactions');
    // await db.execute('DROP TABLE IF EXISTS periods');
    // await db.execute('DROP TABLE IF EXISTS categories');
  }

  Future<void> printTableColumns(String tableName) async {
    final Database db = await database;
    final List<Map<String, dynamic>> tableInfo =
        await db.rawQuery("PRAGMA table_info($tableName);");
    print("Columns in $tableName:");
    for (var column in tableInfo) {
      print("${column['name']} - ${column['type']}");
    }
  }
}
