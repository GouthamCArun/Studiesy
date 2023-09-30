import 'package:avatar_glow/avatar_glow.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:studiesy/Ui/Transcription.dart';
import 'package:studiesy/models/databaseMethods.dart';

import '../Authentication.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({Key? key, this.subject}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final subject;
  @override
  // ignore: library_private_types_in_public_api
  _TeacherScreenState createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  String text = "Press the button and start speaking";
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start the class';
  double _confidence = 1.0;
  final DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref().child('teacher');

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFBE03FD),
        actions: [
          IconButton(
              onPressed: () {
                AuthService().signOut(context);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AvatarGlow(
        endRadius: 70.0,
        animate: _isListening,
        duration: const Duration(milliseconds: 2000),
        glowColor: Colors.red,
        repeat: true,
        repeatPauseDuration: const Duration(milliseconds: 100),
        showTwoGlows: true,
        child: FloatingActionButton(
            onPressed: _listen,
            child: Icon(_isListening ? Icons.mic : Icons.mic_none)),
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              color:
                  const Color(0xFFBE03FD), // Set the container color to white
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    _text,
                    style: const TextStyle(
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color.fromARGB(255, 243, 239, 239),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );

      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          listenFor: const Duration(hours: 1),
          listenMode: stt.ListenMode.dictation,
          pauseFor: const Duration(minutes: 2),
          cancelOnError: true,
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
            if (val.recognizedWords.isNotEmpty) {
              // Create a unique key for each word (you can customize this)
              // Update the database with the word
              databaseReference.set(val.recognizedWords);
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
      DataBaseMethods().updateNotes(widget.subject, _text);
      databaseReference.set("");
    }
  }
}
