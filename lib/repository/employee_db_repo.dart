import 'dart:async';

import 'package:sqflite/sqflite.dart';

import '../model/employee_data_model.dart';

class EmployeeDBRepo {
  final Database database;
  late int count;

  EmployeeDBRepo(this.database);

  Future<bool> insertData(EmployeeDataResponse data) async {

    // await database.insert("membership_batches", data.toJson());
    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT OR REPLACE INTO employee_data(id,name,username,'
          'email)'
          'VALUES("${data.id}","${data.name}","${data.username}","${data.email}")');
      print('inserted1: $id1');
    });
    return true;
  }

  // Future<bool> updateData(EmployeeDataResponse data) async {
  //   await database.update("membership_batches", data.toJson(),
  //       where: "BATCH_NO=?", whereArgs: [data.batchId]);
  //   print('updated with: ${data.toJson()}');
  //   return true;
  // }

  // WHERE NOT EXISTS (Select BATCH_NO From membership_batches WHERE BATCH_NO ="${data.batchId}")

  // Future<bool> updateAMCount(EmployeeDataResponse data) async {
  //   count = await database.rawUpdate(
  //       'UPDATE membership_batches SET TOTAL_AM=?'
  //           ' WHERE BATCH_NO =?',
  //       [data.countAM, data.batchId]);
  //   print(count);
  //   return true;
  // }

  Future<int> countData() async {
    count = Sqflite.firstIntValue(await database
        .rawQuery('SELECT COUNT(*) BATCH_NO FROM membership_batches '))!;
    return count;
  }

  Future<bool> deleteData(String id) async {
    count = await database
        .rawDelete('DELETE FROM membership_batches WHERE BATCH_NO = ?', [id]);
    print(id);
    return true;
  }

  Future<bool> deleteTable() async {
    await database.rawQuery('DROP TABLE IF EXISTS membership_batches');
    return true;
  }

  // Future<List<EmployeeDataResponse>> getData() async {
  //   List<EmployeeDataResponse> batchList = [];
  //   List<Map> list = await database.query(
  //     'membership_batches',
  //   );
  //   print(list);
  //
  //   /// convert to list
  //   list.forEach((map) {
  //     batchList.add(EmployeeDataResponse.fromMap(map));
  //   });
  //   return batchList;
  // }
}
