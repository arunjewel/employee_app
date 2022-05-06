import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/homepage_controller.dart';
import '../widgets/employees_card.dart';
import 'employee_details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<HomePageController>().getDBEmployeeList();
    });

    return Scaffold(
        appBar: AppBar(
          title: const Text("Employee List"),
        ),
        body: Consumer<HomePageController>(builder: (context, model, child) {
          return SafeArea(
            child: Container(
              padding: const EdgeInsets.all(4),
              child: ListView.builder(
                itemCount: model.employeeList.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EmployeeDetailsPage(
                                employeeDataResponse: model.employeeList[i],
                              )));
                    },
                    child: EmployeeCard( employeeDataResponse: model.employeeList[i]),
                  );
                },
              ),
            ),
          );
        }));
  }
}


