import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

final String tableUser = 'users';
final String columnId = '_id';
final String columnUserID = 'uid';

class UserData {
  int id;
  String uid;

  UserData();

  UserData.fromMap(Map<String, dynamic> map){
    id = map[columnId];
    uid = map[columnUserID];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnUserID: uid,
    };
    if(id != null){
      map[columnId] = id;
    }
    return map;
  }
}

class DatabaseHelper {
   static final _databaseName = "UserDatabase.db";

   static final _databaseVersion = 1;

   DatabaseHelper._privateConstructor();
   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

   static Database _database;
   Future<Database> get database async {
     if(_database != null) return _database;
     _database = await _initDatabase();
     return _database;
   }


   _initDatabase() async {
     Directory documentDirectory = await getApplicationDocumentsDirectory();
     String path = join(documentDirectory.path, _databaseName);

     return await openDatabase(path,
         version: _databaseVersion,
         onCreate: _onCreate,
     );
   }

   Future _onCreate(Database db, int version) async {
     await db.execute('''
         CREATE TABLE $tableUser (
          $columnId INTEGER PRIMARY KEY,
          $columnUserID TEXT NOT NULL
         )
     ''');
   }

   //Database helper methods
   Future<int> insert(UserData userData) async {
     Database db = await database;
     int id = await db.insert(tableUser, userData.toMap());
     return id;
   }

   Future<UserData> queryUserData(int id) async {
     Database db = await database;
     List<Map> maps = await db.query(tableUser,
         columns: [columnId, columnUserID],
         where: '$columnId = ?',
         whereArgs: [id],
     );
     if(maps.length > 0){
       return UserData.fromMap(maps.first);
     }
     return null;
   }
}