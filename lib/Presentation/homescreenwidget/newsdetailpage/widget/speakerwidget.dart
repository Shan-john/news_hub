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

  String textToSpeech = "shan jon shone john";

  double volume = 1.0;
  double pitch = 1.0;
  double rate = 1.5;

  Future<void> _speak({required String text}) async {
    await flutterTts.setLanguage(defaultLanguage);
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);
    await flutterTts.setSpeechRate(0.5);
    if (textToSpeech.isNotEmpty) {
      await flutterTts.speak(text);

      Future.delayed(Duration(seconds: 4), () {
        setState(() {
          isSpeakericonCliked = false;
        });
      });
    }
  }

  Future<void> _pause() async {
    await flutterTts.pause();
    setState(() {
      isSpeakericonCliked = false;
    });
  }

  bool isSpeakericonCliked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSpeakericonCliked = !isSpeakericonCliked;
        });
        textToSpeech = widget.content.toString();
        print(textToSpeech);

        isSpeakericonCliked == true ? _speak(text: textToSpeech) : _pause();
        //  setState(() {
        //   isSpeakericonCliked = !isSpeakericonCliked;
        // });
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
}
