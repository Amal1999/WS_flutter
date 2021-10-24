class Task
{
  int? id;
  String description;
  bool done;

  Task({required this.id,required this.done,required this.description});
  toggleDone(){
    this.done = !this.done;
  }
}