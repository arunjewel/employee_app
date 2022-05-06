import 'package:flutter/material.dart';

import '../../model/employee_data_model.dart';

class EmployeeDetailsPage extends StatelessWidget {
  final EmployeeDataResponse employeeDataResponse;

  const EmployeeDetailsPage({Key? key, required this.employeeDataResponse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(employeeDataResponse.name!),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: ListView(
            children: [
              Text(employeeDataResponse.username!),
              Text(employeeDataResponse.email!),
              Text(employeeDataResponse.phone!),
            ],
          ),
        ),
      ),
    );
  }
}
