

import 'package:todos/domain/task.dart';
import 'package:todos/domain/task_repository.dart';

class FakeRepository extends TaskRepository {

  List<Task> tasks = [
    Task(id: 1, text: "Enviar artefatos desenvolvidos na 2º Unidade", category: "Processo de software", deadline: DateTime(2022, 06, 30, 23, 59)),
    Task(id: 2, text: "Atividade sobre o Tópico 3 (Scrum)", category: "Bioestatística", deadline: DateTime(2022, 06, 30, 18, 00)),
    Task(id: 3, text: "Segunda avaliação", category: "Bioestatística", deadline: DateTime(2022, 07, 01, 10, 30)),
    Task(id: 4, text: "Trabalho Prático: Análise de Padrões de Projeto e Refatoração em Sistemas de Software", category: "Desenvolvimento Web", deadline: DateTime(2022, 07, 01, 23, 00)),
    Task(id: 5, text: "Avaliações finais de projeto (Grupo A)", category: "Desenvolvimento Web", deadline: DateTime(2022, 07, 01, 11, 00)),
    Task(id: 6, text: "Avaliações finais de projeto (Grupo B)", category: "Processo de software", deadline: DateTime(2022, 07, 05, 11, 00)),
    Task(id: 7, text: "Apresentação última etapa", category: "Processo de software", deadline: DateTime(2022, 07, 11, 11, 00)),
    Task(id: 8, text: "Terceira avaliação", category: "Desenvolvimento Web", deadline: DateTime(2022, 07, 11, 11, 00)),
    Task(id: 9, text: "Segunda prova", category: "Desenvolvimento Web", deadline: DateTime(2022, 09, 10, 11, 00))
  ];

  @override
  Future<int?> create(String text) {
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getAll() {
    return Future.delayed(Duration(milliseconds: 100), () => this.tasks);
  }

  @override
  Future<Task?> update(int id, bool status) {
    Task? changedTask;
    tasks.forEach((element) {
      if(element.id == id) { changedTask = element; }
    });

    changedTask?.done = status;
    return Future.delayed(Duration(milliseconds: 100), () => changedTask);
  }
}