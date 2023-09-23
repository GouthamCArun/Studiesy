import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class TeacherScreen extends StatelessWidget {
  const TeacherScreen({super.key});

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  @override
  var islistening = false;
  var text = "Press the button and start speaking";
  stt.SpeechToText speech = stt.SpeechToText();

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AvatarGlow(
        endRadius: 75.0,
        animate: islistening,
        duration: Duration(milliseconds: 2000),
        glowColor: Colors.red,
        repeat: true,
        repeatPauseDuration: const Duration(milliseconds: 100),
        showTwoGlows: true,
        child: GestureDetector(
          onTap: () async {
            setState(() {
              islistening = !islistening;
              print(islistening);
            });
            if (islistening) {
              var available = await speech.initialize();

              print("available");
              if (available) {
                speech.listen(
                  onResult: (val) {
                    setState(() {
                      text = val.recognizedWords;
                    });
                  },
                );
              } else {
                print("The user has denied the use of speech recognition.");
              }
            } else {
              speech.stop();
            }
          },
          child: CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 150, 49, 49),
            child: Icon(
              islistening ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
              size: 50,
            ),
          ),
        ),
      ),
      body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Text(text, style: TextStyle(fontSize: 20))),
    );
  }
}
