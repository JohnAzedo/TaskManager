import 'package:todos/domain/group_task.dart';
import 'package:todos/domain/task.dart';
import 'package:todos/domain/task_repository.dart';

class OrderTaskUseCase {
  final TaskRepository repository;
  OrderTaskUseCase({ required this.repository });

  Future<Map<String, List<Task>>> invoke() async {
    var result = new Map<String, List<Task>>();
    var tasks = await repository.getAll();

    tasks.forEach((element) {
      var deadline = _formatDate(element.deadline ?? DateTime.now());
      if(!result.containsKey(deadline)){
        result[deadline] = [];
      }
      result[deadline]?.add(element);
    });

    return result;
  }

  String _formatDate(DateTime datetime) {
    return "${datetime.day.toString().padLeft(2, '0')} de ${months[datetime.month-1]}";
  }

  List<String> months = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
  ];

}