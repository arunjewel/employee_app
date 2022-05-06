// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'dart:io';
// import 'package:flutter/services.dart';
// /// accesss Dbservices.db . function
// class DbServices {
//   DbServices._();
//
//   static final DbServices db = DbServices._();
//
//   static Database? _database;
//
//   Future<Database?> get database async {
//     print("get database.................. DB services....................");
//     if (_database != null) return _database;
//     _database = await initDB();
//     return _database;
//   }
//
//   initDB() async {
//     print("..............init db..........................");
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, "employee_data_db.db");
//
//     final exist = await databaseExists(path);
//     if (exist) {
//       print("db found");
//
//       ///db is available
//
//       Database db = await openDatabase(path,
//           version: 1, onCreate: (db, version) async => onCreate(db, version));
//       return db;
//     } else {
//       print("not found db");
// //db not available
//       try {
//         await Directory(dirname(path)).create(recursive: true);
//       } catch (_) {}
//
//       ByteData data =
//       await rootBundle.load(join('assets', 'employee_data_db.db'));
//       List<int> bytes =
//       data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//
//       // Save copied asset to documents
//       await new File(path).writeAsBytes(bytes, flush: true);
//
//       Database db = await openDatabase(path,
//           version: 1, onCreate: (db, version) async => onCreate(db, version));
//       print("copied db");
//       return db;
//     }
//   }
//
//   onCreate(Database db, int version) async {
//     print("on create db................ version $version ...........");
//
//     await db.execute(
//       "CREATE TABLE IF NOT EXISTS employee_data(id TEXT PRIMARY KEY ,name TEXT,"
//           "fullname TEXT,email TEXT,address TEXT,company TEXT)",
//     );
//
//
//
//     return true;
//   }
// }