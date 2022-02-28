import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_task_management/controllers/authController.dart';
import 'package:todo_task_management/controllers/userController.dart';
import 'package:todo_task_management/service/database.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);

  final AuthController controller = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: GetX<UserController>(initState: (_) async {
          Get.find<UserController>().user =
              await Database().getUser(Get.find<AuthController>().user.uid);
        }, builder: (_) {
          if (_.user.name != null) {
            return Text('Welcome ' + _.user.name);
          } else {
            return Text('Loading...');
          }
        }),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: deprecated_member_use
            RaisedButton(
              onPressed: () {
                controller.signOut();
              },
              child: Text('SignOut'),
            ),
          ],
        ),
      ),
    );
  }
}
