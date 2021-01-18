import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:last_attack/controllers/userController.dart';
import 'package:last_attack/models/user.dart';
import 'package:last_attack/services/database.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>();
  User get user => _firebaseUser.value;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void createUser(String name, String email, String password) async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      UserModel _user =
          UserModel(id: _authResult.user.uid, name: name, email: email);
      if (await Database().createNewUser(_user)) {
        //user succes?
        Get.find<UserController>().user = _user;
        Get.back();
      }
    } catch (e) {
      Get.snackbar('Error creating Account', e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      Get.find<UserController>().user =
          await Database().getUser(_authResult.user.uid);
    } catch (e) {
      Get.snackbar('Error Sign In', e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().clear();
    } catch (e) {
      Get.snackbar('Error Sign Out', e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
