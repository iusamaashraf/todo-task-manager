import 'package:flutter/material.dart';
import 'package:todo_task_management/controllers/authController.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);

  final AuthController controller = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
