import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todo_task_management/controllers/userController.dart';
import 'package:todo_task_management/models/user.dart';
import 'package:todo_task_management/screens/login.dart';
import 'package:todo_task_management/service/database.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _user = Rx<User>();

  User get user => _user.value;

  void oninit() {
    _user.bindStream(_auth.authStateChanges());
  }

  void createUser(String name, String email, String password) async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      // create a user in FirebaseFirestore
      UserModel _user = UserModel(
        id: _authResult.user.uid,
        name: name,
        email: email,
      );
      if (await Database().createNewUser(_user)) {
        //user created successfully
        Get.find<UserController>().user = _user;
        Get.back();
      }
      Get.back();
    } catch (e) {
      Get.snackbar('Error creating account', e.message);
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      Get.find<UserController>().user =
          await Database().getUser(_authResult.user.uid);
    } catch (e) {
      Get.snackbar('Error login account', e.message);
    }
  }

  void signOut() async {
    try {
      Get.find<UserController>().clear();
      await _auth.signOut();
      Get.to(() => Login());
    } catch (e) {
      Get.snackbar('Error signout account', e.message);
    }
  }
}
