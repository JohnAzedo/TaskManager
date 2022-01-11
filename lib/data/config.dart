import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Sqlite {
  Sqlite._();

  static const databaseName = 'tasks.db';
  static final Sqlite instance = Sqlite._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    return await initializeDatabase();
  }

  initializeDatabase() async {
    // print(await getDatabasesPath());
    return await openDatabase(
      join(await getDatabasesPath(), 'tasks.db'),
      onCreate: _onCreate,
      version: 1,
    );
  }

  _onCreate(Database db, int version) async {
    await db.execute(_tasks);
  }

  String get _tasks => '''
    CREATE TABLE tasks(
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      text TEXT, 
      done BOOLEAN
    );
  ''';
}
