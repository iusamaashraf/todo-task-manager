import 'package:flutter/material.dart';
import 'package:todo_task_management/controllers/authController.dart';

class SignUp extends StatelessWidget {
  SignUp({Key key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final AuthController controller = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          'SignUp',
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
                decoration: InputDecoration(
                  hintText: 'Name',
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
                controller: nameController,
              ),
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
                  controller.createUser(
                    nameController.text,
                    emailController.text,
                    passwordController.text,
                  );
                },
                child: Text('SignUp'),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
