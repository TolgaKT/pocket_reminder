import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

const kDayText = TextStyle(
  color: Colors.black,
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
    fontFamily: 'YanoneKaffeesatz',

    );

const kAlertStyle = AlertStyle(
  backgroundColor: Color(0xFF1D1E33),
  titleStyle: TextStyle(
    color: Colors.white,
    fontFamily: 'BebasNeue',
    fontSize: 20.0,
  ),

  animationType: AnimationType.fromTop,
  isCloseButton: false,
  isOverlayTapDismiss: false,

  descStyle: TextStyle(color: Colors.white,
      fontFamily: 'BebasNeue',
      fontSize: 30.0),

);

const kTaskCardStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'BebasNeue',
  fontSize: 30.0,
);