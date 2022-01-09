import 'package:sqflite/sqflite.dart';
import 'package:todos/data/config.dart';
import 'package:todos/domain/task.dart';
import 'package:todos/domain/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository{
  
  Future<Database> getDatabase() async{
    final Database? db = await Sqlite.instance.database;
    if(db == null) {
      throw Exception("Database instance is null");
    }
    return db;
  }

  static const String tableName = "tasks";
  
  @override
  Future<int?> create(String text) async {
    final Database db = await getDatabase();
    int id = await db.insert(tableName, {
      "text": text,
      "done": false
    });
    return id != 0 ? id : null;
  }

  @override
  Future<bool> delete(int id) async {
    final Database db = await getDatabase();
    int rowAffected = await db.delete(tableName, where: "id = ?", whereArgs: [id]);
    return rowAffected != 0;
  }

  @override
  Future<List<Task>> getAll() async {
    final Database db = await getDatabase();
    List<Map<String, dynamic>> maps = await db.query(tableName, columns: ['id', 'text', 'done']);
    List<Task> tasks = [];
    maps.forEach((element) {
      tasks.add(Task.fromDB(element));
    });
    return tasks;
  }

  @override
  Future<Task?> update(int id, bool status) async {
    final Database db = await getDatabase();
    int rowAffected = await db.update(tableName, {'done': status});
    if(rowAffected == 0) return null;

    List<Map<String, dynamic>> maps = await db.query(tableName,
        columns: ['id', 'text', 'done'],
        where: "id = ?",
        whereArgs: [id],
        limit: 1);

    return Task.fromDB(maps.first);
  }
}