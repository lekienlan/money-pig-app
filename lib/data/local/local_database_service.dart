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
    // dropTables();
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
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

    await db.execute("CREATE TABLE transactions ("
        "id TEXT PRIMARY KEY, "
        "amount REAL, "
        "type TEXT, "
        "period_id TEXT, "
        "date TEXT, "
        "updated_at TEXT, "
        "created_at TEXT, "
        "status TEXT, "
        "FOREIGN KEY (period_id) REFERENCES periods(id))");
  }

  Future<void> dropTables() async {
    final Database db = await database;
    await db.delete("pigs");
    await db.delete("periods");
    await db.delete("transactions");

    // _createDatabase(db, 1);
  }
}
