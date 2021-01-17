import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>();
  String get user => _firebaseUser.value?.email;

  @override
  void onInit() {

    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      print(email);
    } catch (e) {
      Get.snackbar('Error creating Account', e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      print('Sign In succesful');
    } catch (e) {
      Get.snackbar('Error Sign In', e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      Get.snackbar('Error Sign Out', e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
