import 'package:flutter/material.dart';
import 'package:qualis_ic/controller/todosController.dart';
import 'package:qualis_ic/models/todos.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  _TodosPageState createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  final controller = TodosController();

  @override
  void initState() {
    controller.fetchTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0,
        title: const Text(
          'Todos',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ValueListenableBuilder<Todos>(
        valueListenable: controller.todos,
        builder: (context, todos, child) {
          return ListTile(
            title: Text(todos.periodico ?? 'Sem título'),
            subtitle: Text(todos.area ?? 'Sem área'),
          );
        },
      ),
    );
  }
}
