import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/homepage_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<HomePageController>().getDBEmployeeList();
    });

    return Scaffold(
        appBar: AppBar(
          title: Text("Employee List"),
        ),
        body: Consumer<HomePageController>(builder: (context, model, child) {
          return SafeArea(
            child: Container(
              padding:const EdgeInsets.all(4),
              child: ListView.builder(
                itemCount: model.employeeList.length,
                itemBuilder: (context, i) {
                  return Card(
                    
                    child: Container(
                      margin:const  EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(model.employeeList[i].name!),
                          Text(model.employeeList[i].email!),
                          Text(model.employeeList[i].username!),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }));
  }
}
