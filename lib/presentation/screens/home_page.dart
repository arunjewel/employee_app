import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/homepage_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<HomePageController>().getEmployeeList();
    });

    return Scaffold(
        appBar: AppBar(
          title: Text("Employee List"),
        ),
        body: Consumer<HomePageController>(builder: (context, model, child) {
          return SafeArea(
            child: Container(
              child: ListView.builder(
                itemCount: model.employeeList.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(model.employeeList[0].toString()),
                  );
                },
              ),
            ),
          );
        }));
  }
}
