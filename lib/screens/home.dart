import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_attack/controllers/authController.dart';
import 'package:last_attack/controllers/todoController.dart';
import 'package:last_attack/controllers/userController.dart';
import 'package:last_attack/services/database.dart';
import 'package:last_attack/widgets/todo_card.dart';

class Home extends GetWidget<AuthController> {
  final TextEditingController _todoController = TextEditingController();
  void _checkBoxClicked() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetX<UserController>(
          initState: (_) async {
            Get.find<UserController>().user =
                await Database().getUser(Get.find<AuthController>().user.uid);
          },
          builder: (_) => (_.user.email != null)
              ? Text('Welcome ' + _.user.name)
              : Text('Loading...'),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              controller.signOut();
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            'Add ToDo Here:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _todoController,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      if (_todoController.text != '') {
                        Database()
                            .addTodo(_todoController.text, controller.user.uid);
                        _todoController.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Text(
            'Your Todos',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          GetX<TodoController>(
            init: Get.put<TodoController>(TodoController()),
            builder: (TodoController todoController) {
              if (todoController.todos != null &&
                  todoController.todos != null) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: todoController.todos.length,
                    itemBuilder: (_, index) {
                      return TodoCard(
                        todo: todoController.todos[index],
                        uid: controller.user.uid,
                      );
                    },
                  ),
                );
              } else {
                return Text('Loading...');
              }
            },
          ),
        ],
      ),
    );
  }
}
