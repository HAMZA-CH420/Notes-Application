import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  /// Singleton class
  DbHelper._();

  Database? DB;
  static final String Note_Table = "notes";
  static final String Column_Notes_sno = "s_no";
  static final String Column_Notes_title = "title";
  static final String Column_Notes_desc = "desc";

  /// Instance to access DbHelper class
  static DbHelper getInstance() => DbHelper._();

  Future<Database> getDb() async {
    ///condition to check if required path exists
    ///if not it will create a new directory
    if (DB != null) {
      return DB!;
    } else {
      DB = await openDb();
      return DB!;
    }
  }

  Future<Database?> openDb() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String DirrPath = join( appDir.path, 'Notes.db');
    return await openDatabase(DirrPath, onCreate: (db, version) {
      ///Tables creation
      db.execute(
          "create table $Note_Table($Column_Notes_sno integer primary key autoincrement,$Column_Notes_title text , $Column_Notes_desc text)");
      //
      //
      //
      //
      //
    },version: 1);
  }

  ///Queries
  Future<bool> addNotes({required String title, required String desc}) async {
    var db = await getDb();
    int rowsEffected = await db.insert(Note_Table, {
      Column_Notes_title: title,
      Column_Notes_desc: desc,
    });
    return rowsEffected > 0;
  }

  Future<bool> updateNote({required String title, required String desc, required int sno}) async {
    var db = await getDb();
    int rowsEffected = await db.update(Note_Table, {
      Column_Notes_title: title,
      Column_Notes_desc: desc,
      Column_Notes_sno: sno,
    });
    return rowsEffected > 0;
  }

  Future<List<Map<String, dynamic>>> getAllNotes() async {
    var db = await getDb();
    return await db.query(Note_Table);
  }

  Future<bool> deleteNote({required int sno}) async {
    var db = await getDb();
    int rowsEffected =
        await db.delete(Note_Table, where: '$Column_Notes_sno = $sno');
    return rowsEffected > 0;
  }
}
