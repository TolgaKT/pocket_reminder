class Task{

  final String name;
  bool isDone;
  final String month;
  final String day;
  final String year;
  final String hour;
  final String minute;

  Task({this.name,this.isDone=false, this.minute,this.hour,this.year,this.month,this.day});

  void toggleDOne(){
    isDone = !isDone;
  }

}