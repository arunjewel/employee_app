import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/employee_data_model.dart';

class DatabaseSql {
  late Database database;
  late int count;

  Future<void> openDatabaseSql() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'employee_db.db');

    // open the database
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE employee_data(id TEXT PRIMARY KEY ,name TEXT,"
              "fullname TEXT,email TEXT,address TEXT,company TEXT)",
        );
      },
    );
  }

  Future<bool> insertData(EmployeeDataResponse employeedetail) async {
    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO employee_data(id,name,username,'
              'email) VALUES("'
              '${employeedetail.id}","${employeedetail.name}","${employeedetail.username}","${employeedetail.email}",'
              '"${employeedetail.name}")');
      print('inserted1: $id1');

      print(id1);
    });
    return true;
  }




  Future<List<EmployeeDataResponse>> getData() async {
    List<EmployeeDataResponse> empList = [];
    List<Map> list = await database.rawQuery('SELECT * FROM employee_data');
print(list.length);
    /// convert to list employeedetail
    list.forEach((map) {
      empList.add(EmployeeDataResponse.fromMap(map));
    });
    return  empList;
  }



}
