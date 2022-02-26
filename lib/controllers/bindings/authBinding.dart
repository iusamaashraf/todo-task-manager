import 'package:get/get.dart';
import 'package:todo_task_management/controllers/authController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
