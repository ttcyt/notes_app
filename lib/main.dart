import 'package:flutter/material.dart';
import 'package:note_app/view/home_page.dart';
import 'package:note_app/view/input_page.dart';
void main()=>runApp(NoteApp());
class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
