import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

import '../controllers/homepage_controller.dart';
import '../repository/employee_db_repo.dart';
import 'api_helper.dart';
import 'db_services.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// initialise base scope

  sl.registerLazySingleton(() => Dio());
  // final Database database = await DbServices.db.database as Database;
  // sl.registerFactory(() => database);
  sl.registerLazySingleton(
    () => ApiConfig(
      client: sl(),
    ),
  );
  // sl.registerLazySingleton(() => EmployeeDBRepo(sl()));
  sl.registerLazySingleton(() =>HomePageController(sl()));

}
