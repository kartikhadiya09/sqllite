import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Datahelper {
  Database? database;

  Future<Database> checkDB() async {
    if (database != null) {
      return database!;
    } else {
      return await initDB();
    }
  }

  Future<Database> initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String pathData = join(dir.path, "MyData.db");
    return openDatabase(pathData, version: 1, onCreate: (Db, version) {
      String queery =
          "CREATE TABLE bio(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,std TEXT,mobail TEXT,dream TEXT)";
      Db.execute(queery);
    });
  }

  void insertData(String n1, String s1, String m1, String d1) async {
    database = await checkDB();
    var res = await database!.insert("bio", {
      "name": n1,
      "std": s1,
      "mobail": m1,
      "dream": d1,
    });
    print("$res");
  }

  void updateData(
      String id,
      String n1,
      String s1,
      String m1,
      String d1,
      ) async {
    database = await checkDB();
    database!.update(
        "bio",
        {
          "id": id,
          "name": n1,
          "std": s1,
          "mobail": m1,
          "dream": d1,
        },
        where: "id = ?",
        whereArgs: [id]);
  }

  void delitData(
      String id,
      ) async {
    database = await checkDB();
    database!.delete("bio", where: "id = ?", whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> readData() async{
    database = await checkDB();

    String query ="SELECT * FROM bio";
    List<Map<String,dynamic>>  l1 = await database!.rawQuery(query);
    return l1;
  }
}
