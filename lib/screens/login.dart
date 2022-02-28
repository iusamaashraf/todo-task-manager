import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_task_management/controllers/authController.dart';
import 'package:todo_task_management/screens/signup.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({Key key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AuthController controller = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          'Login',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.white),
        ),
        // centerTitle: true,
      ),
      body: SafeArea(
          child: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                controller: emailController,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                controller: passwordController,
                obscureText: true,
              ),
              SizedBox(height: 40),
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () {
                  controller.login(
                      emailController.text, passwordController.text);
                },
                child: Text('Login'),
              ),
              SizedBox(height: 40),
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
