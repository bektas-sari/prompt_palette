import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PromptResultScreen extends StatelessWidget {
  final String prompt;
  const PromptResultScreen({required this.prompt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Generated Prompt')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              prompt,
              style: TextStyle(fontSize: 18),
            ),
            Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: prompt));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Prompt copied to clipboard')),
                );
              },
              icon: Icon(Icons.copy),
              label: Text('Copy Prompt'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
