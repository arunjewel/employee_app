import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../core/api_endpoints.dart';
import '../core/api_helper.dart';
import '../core/databse_sql.dart';
import '../model/employee_data_model.dart';

class HomePageController extends ChangeNotifier {
  final ApiConfig apiConfig;

  HomePageController(this.apiConfig);

  bool loading = false;

  bool isFirstTimeMembership = true;

  List<EmployeeDataResponse> _employeeList = [];

  List<EmployeeDataResponse> get employeeList => _employeeList;

  ///----------------------------------

  getEmployeeList() async {
// ApiResponse apiResponse=
//  await   apiConfig.getData(endpointUrl: employeeListUrl);
    final Dio dio = Dio();
    final Response response = await dio.get(employeeListUrl);
    EmployeeDataResponse employeeDataResponse =
        EmployeeDataResponse.fromJson(response.data[1])
    ;

    print("nextt");

    // await sl<EmployeeDBRepo>().insertData(apiResponse.response!.data);
    try {
      DatabaseSql databaseSql = DatabaseSql();
      await databaseSql.openDatabaseSql();
      await databaseSql.insertData(employeeDataResponse);
      // employeeDataResponse.forEach((element) async {
      //   await databaseSql.insertData(element);
      // });

      // await databaseSql.getData();
    } catch (e) {
      print(e);
    } finally {
      notifyListeners();
    }
  }


getDBEmployeeList() async {
  try {
    DatabaseSql databaseSql = DatabaseSql();
    await databaseSql.openDatabaseSql();

    _employeeList=   await databaseSql.getData();

  } catch (e) {
    print(e);
  } finally {
    notifyListeners();
  }
}
}
