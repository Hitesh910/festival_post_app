import 'package:festival_post_app/screen/choice/choice_screen.dart';
import 'package:festival_post_app/screen/edit/edit_screen.dart';
import 'package:festival_post_app/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
Map<String,WidgetBuilder> app_routes = {
  "/":(context) => HomeScreen(),
  "choice":(context) => ChoiceScreen(),
  "edit":(context) => EditScreen()
};