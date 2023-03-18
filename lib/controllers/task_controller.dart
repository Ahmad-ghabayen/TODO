import 'package:get/get.dart';
import 'package:todo1/db/db_helper.dart';
import 'package:todo1/models/task.dart';

class TaskController extends GetxController {
  final taskList = <Task>[].obs;

  Future<int> addTask(Task? task) {
    return DBHelper.insert(task!);
  }

  Future<void> getTasks() async {
    final List<Map<String, dynamic>> tasks = await DBHelper.query();

    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }

  void deleteTask(Task task) async {
    await DBHelper.delete(task);
    getTasks();
  }

  void deleteAllTask() async {
    await DBHelper.deleteAll();
    getTasks();
  }

  void markTaskComplete(int id) async {
    await DBHelper.update(id);
    getTasks();
  }
}
