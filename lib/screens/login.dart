import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_task_management/controllers/authController.dart';
import 'package:todo_task_management/screens/signup.dart';

class Login extends StatelessWidget {
  Login({Key key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AuthController controller = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Login',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'Email'),
                controller: emailController,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Password'),
                controller: passwordController,
                obscureText: true,
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () {
                  controller.login(
                      emailController.text, passwordController.text);
                },
                child: Text('Login'),
              ),
              SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    Get.to(() => SignUp());
                  },
                  child: Text('Sign Up'))
            ],
          ),
        ),
      )),
    );
  }
}
