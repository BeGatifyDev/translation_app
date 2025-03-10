import 'package:flutter/material.dart';

void main() {
  runApp(const TranslationApp());
}

class TranslationApp extends StatelessWidget {
  const TranslationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TranslationScreen(),
    );
  }
}

class TranslationScreen extends StatefulWidget {
  const TranslationScreen({super.key});

  @override
  TranslationScreenState createState() => TranslationScreenState(); // ✅ Remove underscore to make it public
}

class TranslationScreenState extends State<TranslationScreen> { // ✅ Remove underscore
  TextEditingController textController = TextEditingController();
  String translatedText = "Translation appears here";

  void translateText() async {
    // Here, you will call the TypeScript API for translation
    setState(() {
      translatedText = "Translated: ${textController.text}"; // Dummy response
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Translation App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(labelText: "Enter text"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: translateText,
              child: const Text("Translate"),
            ),
            const SizedBox(height: 20),
            Text(translatedText),
          ],
        ),
      ),
    );
  }
}
