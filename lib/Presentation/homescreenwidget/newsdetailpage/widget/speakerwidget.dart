import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SpeakerButton extends StatefulWidget {
  final String content;
  const SpeakerButton({super.key, required this.content});

  @override
  State<SpeakerButton> createState() => _SpeakerButtonState();
}

class _SpeakerButtonState extends State<SpeakerButton> {
  final String defaultLanguage = 'en-US';

  late FlutterTts flutterTts;
  String textToSpeech = "Hello, Flutter TTS!";
  bool isPlaying = false;
  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
  }

  Future<void> _speak() async {
    if (textToSpeech.isNotEmpty) {
      await flutterTts.speak(textToSpeech);
      setState(() {
        isPlaying = true;
      });
    }
  }

  Future<void> _pause() async {
    await flutterTts.pause();
    setState(() {
      isPlaying = false;
    });
  }


  bool isSpeakericonCliked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
         isPlaying ? _pause : _speak;
        setState(() {
          isSpeakericonCliked = !isSpeakericonCliked;
        });
      },
      child: isSpeakericonCliked == false
          ? Icon(
              Icons.volume_off_rounded,
              color: Colors.white,
              size: 30,
            )
          : Icon(
              Icons.volume_up_rounded,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 30,
            ),
    );
  }
}
