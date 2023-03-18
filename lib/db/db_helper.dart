import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo1/models/task.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String tableName = 'tasks';

  static Future initDb() async {
    if (_db != null) {
      return;
    } else {
      try {
        String _path = await getDatabasesPath() + 'task.db';
        _db = await openDatabase(_path, version: _version,
            onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
            'CREATE TABLE $tableName ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'title STRING, note Text,date STRING,'
            'startTime STRING,endTime STRING,'
            'remind INTEGER , repeat STRING,'
            'color INTEGER,'
            'isCompleted INTEGER )',
          );
        });
        print('database created ');
      } catch (e) {
        print(e);
      }
    }
  }

  static Future<int> insert(Task task) async {
    print('insert function called');
    try{
      return await _db!.insert(tableName, task.toJson());

    } catch(e){
          print(e);
          return 9000;
    }
  }

  static Future<int> delete(Task task) async {
    print('delete function called');
    return await _db!.delete(tableName, where: 'id = ?', whereArgs: [task.id]);
  }

  static Future<int> deleteAll() async {
    print('delete function called');
    return await _db!.delete(tableName);
  }


  static Future<List<Map<String, dynamic>>> query() async {
    print('query function called');
    return await _db!.query(tableName);
  }

  static Future<int> update(int id) async {
    print('update function called ');
    return await _db!.rawUpdate('''
    UPDATE tasks
    SET isCompleted = ? 
    WHERE id = ?
    ''', [1, id]);
  }
}
