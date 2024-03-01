import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/models/todo.dart';

class TarefaRepository {
  TarefaRepository() {
    SharedPreferences.getInstance().then((value) => sharedPreferences = value);
  }

  late SharedPreferences sharedPreferences;

  void saveTarefas(List<Todo> tarefas) {
    final jsonString = json.encode(tarefas);
    sharedPreferences.setString('lista_terfas', jsonString);
  }
}
