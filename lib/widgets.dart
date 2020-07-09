import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


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

  TaskTile({this.isChecked, this.taskTitle,this.checkBoxCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.map,
        color: Colors.white,
      ),
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
    );
  }
}



class InputCards extends StatelessWidget {
  InputCards({this.onPressed, this.cardChild, this.colour});

  final Function onPressed;
  final Widget cardChild;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: cardChild,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime dateTime;



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
              dateTime = date;

            });
          });
        },
        padding: EdgeInsets.all(0.0),
        child: Container(
          width: double.infinity,
          child: Text(
            dateTime == null
                ? 'Add date'
                : dateTime.day.toString() +
                    '/' +
                    dateTime.month.toString() +
                    '/' +
                    dateTime.year.toString(),
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
  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay _time;

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
              _time == null
                  ? 'Add Time'
                  : _time.hour.toString() + ':' + _time.minute.toString(),
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
                _time = selectedTime;
              });
            });
          }),
    );
  }
}
