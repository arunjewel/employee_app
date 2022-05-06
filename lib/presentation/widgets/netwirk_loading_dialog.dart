import 'package:flutter/material.dart';

void showNetworkLoadingDialog(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const Dialog(
        child: SizedBox(
          height: 100,
          width: 200,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ));
}
