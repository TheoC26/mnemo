import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mnemo_app/components/input_full.dart';
import 'package:mnemo_app/styles/background_styles.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';

class SendMemory extends StatefulWidget {
  const SendMemory({Key? key}) : super(key: key);

  @override
  _SendMemoryState createState() => _SendMemoryState();
}

class _SendMemoryState extends State<SendMemory> {
  final TextEditingController captionController = TextEditingController();
  late AudioRecorder audioRecord;
  late Directory appDocDir;
  late File audioFile;

  // listen
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = const Duration();
  Duration position = const Duration();

  // variable is recording
  bool isRecording = false;
  bool recordingDone = false;
  XFile? _image; // Variable to store the picked image

  List<Permission> lp = Permission.values;

  @override
  void initState() {
    getApplicationDocumentsDirectory().then((Directory directory) {
      appDocDir = directory;
      audioFile =
          File('${appDocDir.path}/audioFile.aac'); // Initialize audioFile here
    });
    audioRecord = AudioRecorder();
    super.initState();
  }

  @override
  void dispose() {
    audioRecord.dispose();
    super.dispose();
  }

  Future<void> _recordAudio() async {
    final status = await Permission.microphone.request();
    print("status: $status");

    if (status.isDenied) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('Microphone access'),
          content: const Text(
              'Please grant access to the microphone to record an audio.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    } else {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String filePath = '${appDocDir.path}/audio.m4a';
      if (!isRecording) {
        print("start recording");
        await audioRecord.start(const RecordConfig(), path: filePath);
        setState(() {
          isRecording = true;
        });
      } else {
        print("stop recording");
        final path = await audioRecord.stop();
        print(path);
        final audioFile = File(path!);
        setState(() {
          isRecording = false;
          recordingDone = true;
        });
      }
    }
  }

  Future<void> _pickImage() async {
    final status = await Permission.photos.request();

    if (status.isGranted) {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
      });
    } else if (status.isPermanentlyDenied) {
      // The user opted to never again see the permission request dialog for this
      // app. The only way to change the permission's status now is to let the
      // user manually enable it in the system settings.
      openAppSettings();
    } else {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('Photos access'),
          content:
              const Text('Please grant access to photos to select an image.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Send a memory',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
          child: Column(children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: _image == null
                    ? greyBackgroundDecoration
                    : BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(_image!.path),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(62, 0, 0, 0),
                            offset: Offset(0, 4),
                            spreadRadius: -6,
                            blurRadius: 8,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          width: 1,
                        ),
                      ),
                child: _image == null
                    ? const Center(
                        child: Text(
                          'Select a photo',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFAFAFAF),
                          ),
                        ),
                      )
                    : Text(""), // Display the picked image
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: greyBackgroundDecoration,
              child: TextField(
                controller: captionController,
                textCapitalization: TextCapitalization.sentences,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                decoration: const InputDecoration(
                  hintText: "Add a caption",
                  hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFAFAFAF)),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            !recordingDone
                ? GestureDetector(
                    onTap: () {
                      // record audio
                      _recordAudio();
                    },
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Color(0xFFE2DAE9),
                            Color(0xFFE3D8E9),
                          ],
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFD7C9E2),
                            offset: Offset(0, 4),
                            spreadRadius: -6,
                            blurRadius: 8,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          width: 1,
                        ),
                      ),
                      child: const Icon(
                        Icons.mic,
                        color: Color(0xFF4a4a4a),
                        size: 40,
                      ),
                    ),
                  )
                : CupertinoButton(
                    child: Text("listen"),
                    onPressed: () async {
                      if (isPlaying) {
                        setState(() {
                          isPlaying = false;
                        });
                        await audioPlayer.pause();
                        // update isPlaying state
                      } else {
                        setState(() {
                          isPlaying = true;
                        });
                        audioPlayer.setSourceUrl(audioFile.path);
                        await audioPlayer.play(audioPlayer.source!);

                        // update isPlaying state
                        // on complete
                        audioPlayer.onPlayerComplete.listen((event) {
                          print("complete");
                          setState(() {
                            isPlaying = false;
                          });
                        });
                      }
                    }),
          ]),
        ));
  }
}
