import 'package:flutter/material.dart';
import '../widgets/custom_dropdown.dart';
import '../data/artist_styles.dart';
import '../data/objects.dart';
import '../data/themes.dart';
import 'prompt_result_screen.dart';

class PromptGeneratorScreen extends StatefulWidget {
  @override
  State<PromptGeneratorScreen> createState() => _PromptGeneratorScreenState();
}

class _PromptGeneratorScreenState extends State<PromptGeneratorScreen> {
  String? selectedArtist;
  String? selectedObject;
  String? selectedTheme;

  void _generatePrompt() {
    if (selectedArtist != null && selectedObject != null && selectedTheme != null) {
      final prompt =
          'A ${selectedTheme!.toLowerCase()} illustration of a ${selectedObject!.toLowerCase()} in the style of ${selectedArtist!}';
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PromptResultScreen(prompt: prompt),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AI Art Prompt Generator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            CustomDropdown(
              label: '🎨 Artist Style',
              items: artistStyles,
              value: selectedArtist,
              onChanged: (value) => setState(() => selectedArtist = value),
            ),
            SizedBox(height: 20),
            CustomDropdown(
              label: '🧱 Object',
              items: objectList,
              value: selectedObject,
              onChanged: (value) => setState(() => selectedObject = value),
            ),
            SizedBox(height: 20),
            CustomDropdown(
              label: '🌌 Theme',
              items: themeList,
              value: selectedTheme,
              onChanged: (value) => setState(() => selectedTheme = value),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: _generatePrompt,
              child: Text('Generate Prompt'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
