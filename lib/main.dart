import 'package:flutter/material.dart';
import 'curriculum_screen.dart';
import 'my_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Currículo Flutter',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      // Passa a instância dos dados para a tela principal
      home: CurriculumScreen(curriculum: myCurriculumData), 
    );
  }
}