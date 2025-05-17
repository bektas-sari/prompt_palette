import 'package:flutter/material.dart';
import 'screens/prompt_generator_screen.dart';

void main() {
  runApp(PromptPaletteApp());
}

class PromptPaletteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prompt Palette',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF9F9F9),
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: PromptGeneratorScreen(),
    );
  }
}
