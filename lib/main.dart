import 'package:flutter/material.dart';
//import the package for the speech
import 'package:flutter_tts/flutter_tts.dart';
//import 'package:langread/Util/pick_document.dart';
//import 'package:pdf_text/pdf_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  //using the import of the text to speech library
  FlutterTts tts = FlutterTts();

  //create function for speech, needs to be a async
  void speak({String? text}) async {
    //since it is async i need to use await
    await tts.speak(text!);
    //await tts.speak('Hello, world!');
  }

  //stop function
  void stop() async {
    await tts.stop();
  }

  //stop function
  void delete() async {
    //clear controller
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('Pdf to Text'),
          actions: [
            IconButton(
              onPressed: () {
                //call play function but with an if statement because if there is not text within
                //it cannot play.  The if test for
                if (controller.text.isNotEmpty) {
                  speak(text: controller.text.trim());
                }
              },
              icon: const Icon(Icons.play_arrow),
            ),
            IconButton(
              onPressed: () {
                //call stop
                stop();
              },
              icon: const Icon(Icons.stop),
            ), // This trailing comma makes auto-formatting nicer for build methods.

            IconButton(
              onPressed: () {
                //delete function
              },
              icon: const Icon(Icons.delete),
            ),
          ]),
      body: Container(
        //add padding to the body container
        padding: const EdgeInsets.all(20),
        child: TextFormField(
          controller: controller,
          //this is so the letters can go to the next line
          maxLines: MediaQuery.of(context).size.height.toInt(),
          //input text with no decoration and a label so the user knows where the text goes
          decoration: const InputDecoration(
              border: InputBorder.none, label: Text('Enter the text...')),
        ),
      ),
      //   floatingActionButton: FloatingActionButton.extended(
      //       onPressed: () {
      //         pickDocument().then((value) => {
      //               if (value != '')
      //                 {
      //                   //get the file and decode it using pdf text
      //                   controller.text = value
      //                 }
      //             });
      //       },
      //       label: const Text('Pick pdf File')),
    );
  }
}
