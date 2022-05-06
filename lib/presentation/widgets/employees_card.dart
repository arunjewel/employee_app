import 'package:flutter/material.dart';

import '../../model/employee_data_model.dart';

class EmployeeCard extends StatelessWidget {
  final EmployeeDataResponse employeeDataResponse;

  const EmployeeCard({Key? key, required this.employeeDataResponse})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: 50,
              child: Image.network(
                employeeDataResponse.profileImage!,
              ),
            ),
            Text(employeeDataResponse.name!),
            Text(employeeDataResponse.email!),
            Text(employeeDataResponse.username!),
          ],
        ),
      ),
    );
  }
}
