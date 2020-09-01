import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pocket_reminder/constants.dart';


class ReusableCard extends StatelessWidget {
  ReusableCard({
    @required this.colour,
    this.cardChild,
    this.cardFunction,
  });

  final Color colour;
  final Widget cardChild;
  final Function cardFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colour,
      ),
    );
  }
}

class TaskTile extends StatelessWidget{
  final bool isChecked;
  final String taskTitle;
  final Function checkBoxCallBack;
  final String taskDesc;
  

  TaskTile({this.isChecked, this.taskTitle,this.checkBoxCallBack,this.taskDesc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showModalBottomSheet(context: context, isScrollControlled: true ,builder: (context)=>SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: TaskDetailsScreen(taskTitle: taskTitle,taskDesc: taskDesc ,taskHour: TimePicker.time.hour.toString(), taskMinute: TimePicker.time.minute.toString(),
            taskDay: DatePicker.dateTime.day.toString(),
            taskMonth: DatePicker.dateTime.month.toString(),
            taskYear: DatePicker.dateTime.year.toString(),
            ),
          ),
        ));
      },
      child: ListTile(

        trailing: Checkbox(
          value: isChecked,
          onChanged: checkBoxCallBack,
        ),
        title: Text(
          taskTitle,
          style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontFamily: 'PatrickHand',
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
      ),
    );
  }
}

class DatePicker extends StatefulWidget {
  static DateTime dateTime;



  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
   DateTime selectedDate;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RaisedButton(
        onPressed: () {
          showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2019),
                  lastDate: DateTime(2080))
              .then((date) {
            setState(() {
              selectedDate = date;
              DatePicker.dateTime = selectedDate;
            });
          });
        },
        padding: EdgeInsets.all(0.0),
        child: Container(
          width: double.infinity,
          child: Text(
            selectedDate == null
                ? 'Add date'
                : selectedDate.day.toString() +
                    '/' +
                selectedDate.month.toString() +
                    '/' +
                selectedDate.year.toString(),
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'BebasNeue',
            ),
            textAlign: TextAlign.center,
          ),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}

class TimePicker extends StatefulWidget {
  static TimeOfDay time;

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay _selectedTime;

  @override

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RaisedButton(
          padding: EdgeInsets.all(0.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: Text(
              _selectedTime == null
                  ? 'Add Time'
                  : _selectedTime.hour.toString() + ':' + _selectedTime.minute.toString(),
              style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'BebasNeue',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          color: Colors.white.withOpacity(0.7),
          onPressed: () {
            showTimePicker(context: context, initialTime: TimeOfDay.now())
                .then((selectedTime) {
              setState(() {
                _selectedTime = selectedTime;
                TimePicker.time = _selectedTime;
              });
            });
          }),
    );
  }
}

class TaskDetailsScreen extends StatelessWidget {

  final String taskTitle;
  final String taskDay;
  final String taskMonth;
  final String taskYear;
  final String taskHour;
  final String taskMinute;
  final String taskDesc;

  TaskDetailsScreen({this.taskTitle,this.taskDay,this.taskMonth,this.taskYear,this.taskHour,this.taskMinute,this.taskDesc});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF111328).withOpacity(0.5),
      child: Container(
        padding: EdgeInsets.all(20.0),

        decoration: BoxDecoration(
          color: Color(0xFF1D1E33),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0)
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(taskTitle,style: kTaskCardStyle,),
            SizedBox(height: 10.0,),
            Text('Date: ' + taskMonth + '/' + taskDay + '/' + taskYear,style: kTaskCardStyle,),
            SizedBox(height: 10.0),
            Text('Time: ' + taskHour + ':' + taskMinute,style: kTaskCardStyle,),
            SizedBox(height: 10.0,),
            Text(taskDesc != null ? 'Description: ' + taskDesc : 'No description', style: kTaskCardStyle,),
          ],
        ),
      ),
    );
  }
}


