import 'package:get/get.dart';
import 'package:last_attack/controllers/authController.dart';
import 'package:last_attack/models/todo.dart';
import 'package:last_attack/services/database.dart';

class TodoController extends GetxController {
  Rx<List<TodoModel>> todoList = Rx<List<TodoModel>>();
  List<TodoModel> get todos => todoList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.uid;
    todoList.bindStream(Database().todoStream(uid));
  }
}
