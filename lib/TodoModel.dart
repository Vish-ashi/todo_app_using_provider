import 'package:flutter/cupertino.dart';
import 'package:todo_app/TaskModel.dart';



class TodoModel extends ChangeNotifier{
  List<TaskModel> taskList = []; //contians all the task

  addTaskInList(){
    TaskModel taskModel = TaskModel("title ${taskList.length}", "this is the task no detail ${taskList.length}");
    taskList.add(taskModel);

    notifyListeners();
    //code to do
  }

}