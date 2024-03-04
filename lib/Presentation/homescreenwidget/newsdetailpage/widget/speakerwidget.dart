import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';

//
class SpeakerButton extends StatefulWidget {
  final String content;
  const SpeakerButton({super.key, required this.content});

  @override
  State<SpeakerButton> createState() => _SpeakerButtonState();
}

class _SpeakerButtonState extends State<SpeakerButton> {
  final String defaultLanguage = 'en-US';

  FlutterTts flutterTts = FlutterTts();

  String textToSpeech = "not recognized";

  double volume = 1.0;
  double pitch = 1.0;
  double rate = 1.0;

  Future<void> _speak({required String text}) async {
    await flutterTts.setLanguage(defaultLanguage);
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);
    await flutterTts.setSpeechRate(0.5);
    if (textToSpeech.isNotEmpty) {
      await flutterTts.speak(text);
    }
  }

  Future<void> _pause() async {
    await flutterTts.pause();
  }

  bool isSpeakericonCliked = false;
  @override
  void dispose() {
    _pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSpeakericonCliked = !isSpeakericonCliked;
        });
        textToSpeech = widget.content.toString();

        isSpeakericonCliked == true ? _speak(text: textToSpeech) : _pause();
      },
      child: isSpeakericonCliked == false
          ? const Icon(
              Icons.volume_off_rounded,
              color: Colors.white,
              size: 30,
            )
          : const Icon(
              Icons.volume_up_rounded,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 30,
            ),
    );
  }

  Future<Null> Delay(int second) {
    return Future.delayed(Duration(seconds: second), () {
      setState(() {
        isSpeakericonCliked = false;
      });
    });
  }
}
