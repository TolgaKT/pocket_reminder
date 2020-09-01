import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_reminder/widgets.dart';
import 'package:provider/provider.dart';
import 'package:pocket_reminder/models/task_data.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:pocket_reminder/constants.dart';

class InputScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTextTitle;
    String newTextDesc;

    return Scaffold(
      backgroundColor: Color(0xFF111328),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'CREATE',
                      style: TextStyle(fontSize: 30.0, fontFamily: 'BebasNeue'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'NEW TASK',
                      style: TextStyle(fontSize: 30.0, fontFamily: 'BebasNeue'),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'Name',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'PatrickHand',
                          color: Colors.white.withOpacity(0.7)),
                    ),
                    TextField(
                      onChanged: (newValue) {
                        newTextTitle = newValue;
                      },
                      decoration: InputDecoration(hintText: 'Enter Task'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      onChanged: (newValue){
                        newTextDesc = newValue;
                      },
                      decoration: InputDecoration(hintText: 'Enter Description (optional)'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(0.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF1D1E33),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0)),
                  ),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                'Date',
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontFamily: 'PatrickHand',
                                    color: Colors.white.withOpacity(0.7)),
                              ),
                              SizedBox(
                                width: 40.0,
                              ),
                              DatePicker(),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                'Time',
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontFamily: 'PatrickHand',
                                    color: Colors.white.withOpacity(0.7)),
                              ),
                              SizedBox(
                                width: 40.0,
                              ),
                              TimePicker()
                            ],
                          ),
                        ),
                        Expanded(
                            child: RaisedButton(
                          color: Color(0xFF1D1E33),
                          padding: EdgeInsets.all(0.0),
                          onPressed: () {
                            if (newTextTitle == null) {
                              Alert(
                                  context: context,
                                  type: AlertType.info,
                                  style: kAlertStyle,
                                  desc: 'Name of the task cannot be empty!',
                                  title: 'Error',
                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        'OK',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontFamily: 'BebasNeue',
                                        ),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      color: Colors.deepPurple,
                                    )
                                  ]).show();
                            } else if (TimePicker.time == null) {
                              Alert(
                                  style: kAlertStyle,
                                  context: context,
                                  type: AlertType.info,
                                  desc: 'Time of the task cannot be empty!',
                                  title: 'Error',
                                  buttons: [
                                    DialogButton(
                                      child: Text('Ok',style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'BebasNeue',
                                      ),),
                                      onPressed: () => Navigator.pop(context),
                                      color: Colors.deepPurple,
                                    )
                                  ]).show();
                            } else {
                              Provider.of<TaskData>(context, listen: false)
                                  .addTask(newTextTitle, DatePicker.dateTime,
                                      TimePicker.time,newTextDesc);

                              Navigator.pop(context);
                            }

                            //
                            // todo : implement wrong date alerts when user selects previous dates!
                          },
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20.0),
                                  topLeft: Radius.circular(20.0)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.add),
                                Text(
                                  'Create Task',
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontFamily: 'BebasNeue',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
