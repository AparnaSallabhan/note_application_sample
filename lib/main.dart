// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:note_application_sample/view/note_list_screen/note_list_screen.dart';

void main(){
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NoteListScreen(),
    );
  }
}