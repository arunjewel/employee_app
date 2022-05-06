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

    return Container();
  }
}
