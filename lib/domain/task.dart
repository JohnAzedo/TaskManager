
class Task{
  int? id;
  String text;
  bool done = false;
  String? category;
  DateTime? deadline;

  Task({required this.id, required this.text, bool? done, this.category, this.deadline}){
    _setInitialStatus(done);
  }

  void changeStatus(){
    done = !done;
  }

  void _setInitialStatus(bool? done){
    if(done != null){
      this.done = done;
    }
  }

  Task.fromDB(Map<String, dynamic> map):
      id = map['id'],
      text = map['text'],
      done = map['done'] == 1;
}