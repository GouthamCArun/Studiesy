import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'tts.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    initializeTts();
  }

  Future<void> initializeTts() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(1.0);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
  }

  Future<void> speak(String text) async {
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text('Audio Screen'),
            TextButton(
              onPressed: () async {
                TextToSpeech.speak();
              },
              child: const Text('Speak'),
            ),
          ],
        ),
      ),
    );
  }
}
