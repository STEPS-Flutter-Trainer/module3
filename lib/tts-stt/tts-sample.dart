import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const TextToSpeech());
}
class TextToSpeech extends StatefulWidget {
  const TextToSpeech({super.key});

  @override
  State<TextToSpeech> createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
    TextEditingController(text: 'Hello world');
    final FlutterTts tts = FlutterTts();
    _TextToSpeechState() {
      tts.setLanguage('en');
      tts.setSpeechRate(1.0);
    }


    return Scaffold(
      appBar: AppBar(
        title: Text("Text to speech"),
      ),
      body: Column(children: [
        TextField(
          controller: controller,
        ),
        ElevatedButton(onPressed: () {
          tts.speak(controller.text);
        }, child:Text("speak"))
      ]),
    );
  }
}


