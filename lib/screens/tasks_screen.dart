import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_reminder/screens/input_screen.dart';
import 'package:pocket_reminder/widgets.dart';
import 'package:pocket_reminder/constants.dart';
import 'package:pocket_reminder/models/task_data.dart';
import 'package:provider/provider.dart';

var dayOfWeek = [
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday'
];
var monthDay = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];

String month;
String weekDay;
String day;
String mon;
String tue;
String wed;
String thu;
String fri;
String sat;
String sun;

var cardWidget = [
  Expanded(
    child: ReusableCard(
      colour: DateTime.now().weekday == 1
          ? Colors.white
          : Color(0xff06015e).withOpacity(0.4),
      cardChild: Column(
        children: <Widget>[
          Text('M', style: kDayText),
          Text(mon, style: kDayText),
        ],
      ),
    ),
  ),
  Expanded(
    child: ReusableCard(
      colour: DateTime.now().weekday == 2
          ? Colors.white
          : Color(0xff06015e).withOpacity(0.4),
      cardChild: Column(
        children: <Widget>[
          Text('T', style: kDayText),
          Text(tue, style: kDayText),
        ],
      ),
    ),
  ),
  Expanded(
    child: ReusableCard(
      colour: DateTime.now().weekday == 3
          ? Colors.white
          : Color(0xff06015e).withOpacity(0.4),
      cardChild: Column(
        children: <Widget>[
          Text('W', style: kDayText),
          Text(wed, style: kDayText),
        ],
      ),
    ),
  ),
  Expanded(
    child: ReusableCard(
      colour: DateTime.now().weekday == 4
          ? Colors.white
          : Color(0xff06015e).withOpacity(0.4),
      cardChild: Column(
        children: <Widget>[
          Text('T', style: kDayText),
          Text(thu, style: kDayText),
        ],
      ),
    ),
  ),
  Expanded(
    child: ReusableCard(
      colour: DateTime.now().weekday == 5
          ? Colors.white
          : Color(0xff06015e).withOpacity(0.4),
      cardChild: Column(
        children: <Widget>[
          Text('F', style: kDayText),
          Text(fri, style: kDayText),
        ],
      ),
    ),
  ),
  Expanded(
    child: ReusableCard(
      colour: DateTime.now().weekday == 6
          ? Colors.white
          : Color(0xff06015e).withOpacity(0.4),
      cardChild: Column(
        children: <Widget>[
          Text('S', style: kDayText),
          Text(sat, style: kDayText),
        ],
      ),
    ),
  ),
  Expanded(
    child: ReusableCard(
      colour: DateTime.now().weekday == 7
          ? Colors.white
          : Color(0xff06015e).withOpacity(0.4),
      cardChild: Column(
        children: <Widget>[
          Text('S', style: kDayText),
          Text(sun, style: kDayText),
        ],
      ),
    ),
  ),
];

void getDate() {
  month = monthDay[DateTime.now().month - 1];
  day = DateTime.now().day.toString();

  weekDay = dayOfWeek[DateTime.now().weekday];
}

void adjustDateCard() {
  String wd = DateTime.now().weekday.toString();
  int subtractor = int.parse(wd);
  mon = (DateTime.now().add(Duration(days: 1 - subtractor))).day.toString();
  tue = (DateTime.now().add(Duration(days: 2 - subtractor))).day.toString();
  wed = (DateTime.now().add(Duration(days: 3 - subtractor))).day.toString();
  thu = (DateTime.now().add(Duration(days: 4 - subtractor))).day.toString();
  fri = (DateTime.now().add(Duration(days: 5 - subtractor))).day.toString();
  sat = (DateTime.now().add(Duration(days: 6 - subtractor))).day.toString();
  sun = (DateTime.now().add(Duration(days: 7 - subtractor))).day.toString();
}




class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  void initState() {
    getDate();
    adjustDateCard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
//          gradient: LinearGradient(
//            begin: Alignment.centerLeft,
//            end: Alignment.centerRight,
//            colors: [Color(0xff301bcf).withOpacity(0.95),Colors.red.withOpacity(0.95)],
//          )
          color: Color(0xFF111328),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SafeArea(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0)),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [Color(0xff301bcf), Colors.red],
                    )
                    //color: Color(0xFFffd3ba),
                    ),
                child: Column(
                  children: <Widget>[
                    Text(
                      "$weekDay $day, $month",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 30.0,
                        fontFamily: 'BebasNeue',
                      ),
                    ),

                    SizedBox(
                      height: 25.0,
                    ),
                    SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: cardWidget,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Today',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'BebasNeue',
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: ReusableCard(
                      colour: Color(0xFF1D1E33),
                      cardChild: Consumer<TaskData>(
                        builder: (context, taskData , child){
                          return  ListView.builder(itemBuilder: (context,index){
                            final task = taskData.tasks[index];
                            return Dismissible(
                              key: Key(task.toString()),
                              onDismissed: (direction){
                                taskData.deleteTaskToday(task);
                              },
                              child: TaskTile(
                                //tasks[index].name
                                //taskTitle: tasks[index].name , isChecked: tasks[index].isDone
                                  taskTitle: task.name ,
                                  isChecked: task.isDone,
                                  taskDesc: task.desc,
                                  checkBoxCallBack: (bool checkBoxState){
                                    taskData.updateTask(task);
                                  }
                              ),
                            );
                          }, itemCount: taskData.taskCount,);

                        },

                      )
                    ),
                  ),
                  Text(
                    'Tomorrow',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'BebasNeue',
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: ReusableCard(
                      colour: Color(0xFF1D1E33),
                      cardChild: Consumer<TaskData>(
                        builder: (context,taskData,child){
                          return ListView.builder(itemBuilder: (context,index){
                            final task = taskData.tomTask[index];
                            return Dismissible(
                              key: Key(task.toString()),
                              onDismissed: (direction){
                                taskData.deleteTaskTom(task);
                              },
                              child: TaskTile(
                                taskTitle: task.name,
                                isChecked: task.isDone,
                                checkBoxCallBack: (bool checkBoxState){
                                  taskData.updateTask(task);
                                },
                              ),
                            );
                          },itemCount: taskData.tomTaskCount);
                        },
                      )
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push((context), MaterialPageRoute(
                          builder: (context) => InputScreen()
                        ));
                      },
                      textColor: Colors.white,
                      padding: EdgeInsets.all(0.0),
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Color(0xff301bcf), Colors.red],
                          ),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Add Task',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30.0, fontFamily: 'BebasNeue'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
