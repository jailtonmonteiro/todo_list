import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/models/todo.dart';

const listaTarefa = 'lista_tarefas';

class TarefaRepository {
  TarefaRepository() {
    SharedPreferences.getInstance().then((value) {
      sharedPreferences = value;
      print(sharedPreferences.getString('lista_tarefas'));
    });
  }
  late SharedPreferences sharedPreferences;

  Future<List<Todo>> getListaTarefa() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(listaTarefa) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((e) => Todo.fromJson(e)).toList();
  }

  void saveTarefas(List<Todo> tarefas) {
    final jsonString = json.encode(tarefas);
    sharedPreferences.setString(listaTarefa, jsonString);
    print(jsonString);
  }
}
