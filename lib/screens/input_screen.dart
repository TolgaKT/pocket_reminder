import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_reminder/widgets.dart';


class InputScreen extends StatelessWidget {


  final Function addTaskCallBack;

  InputScreen(this.addTaskCallBack);

  @override
  Widget build(BuildContext context) {
    String newTextTitle;
    DateTime newTextDate;

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
                      onChanged: (newValue){
                        newTextTitle = newValue;

                      },

                      decoration: InputDecoration(hintText: 'Enter Task'),
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
                            onPressed: (){
                              addTaskCallBack(newTextTitle, newTextDate);
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,

                              decoration: BoxDecoration(
                                color: Colors.deepPurpleAccent,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.add),
                                  Text('Create Task', style: TextStyle(
                                    fontSize: 30.0,
                                    fontFamily: 'BebasNeue',

                                  ),)
                                ],
                              ),
                            ),
                          )
                        )
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
