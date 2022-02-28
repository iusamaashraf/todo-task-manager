import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_task_management/controllers/bindings/authBinding.dart';
import 'package:todo_task_management/utils/root.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: AuthBinding(),
      home: Root(),
      darkTheme: ThemeData.dark(),
    );
  }
}
