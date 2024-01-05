import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:trivia_app/main.dart';
import 'package:trivia_app/screens/BottomNavigation.dart';
import 'package:trivia_app/screens/Dashboard.dart';
import 'package:trivia_app/screens/ForgotPassword.dart';
import 'package:trivia_app/screens/Registration.dart';
import 'package:trivia_app/screens/Settings.dart';

final Map<String, WidgetBuilder> routes = {
  Login.routeName: (BuildContext context) => Login(),
  Dashboard.routeName: (BuildContext context) => Dashboard(),
  Registration.routeName: (BuildContext context) => Registration(),
  ForgotPassword.routeName: (BuildContext context) => ForgotPassword(),
  Settings.routeName: (BuildContext context) => Settings(),
  BottomNavigator.routeName: (BuildContext context) => BottomNavigator(),
};
