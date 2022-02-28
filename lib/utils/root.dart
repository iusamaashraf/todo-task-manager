import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_task_management/controllers/authController.dart';
import 'package:todo_task_management/controllers/userController.dart';
import 'package:todo_task_management/screens/home.dart';
import 'package:todo_task_management/screens/login.dart';

class Root extends StatelessWidget {
  Root({Key key}) : super(key: key);
  final AuthController controller = AuthController();
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          return Login();
        } else {
          return Home();
        }
      },
    );
  }
}
