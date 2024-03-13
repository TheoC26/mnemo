import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MemoryPage extends StatefulWidget {
  const MemoryPage({Key? key}) : super(key: key);

  @override
  _MemoryPageState createState() => _MemoryPageState();
}

class _MemoryPageState extends State<MemoryPage> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = const Duration();
  Duration position = const Duration();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/mnemo-53581.appspot.com/o/familyPicture.png?alt=media&token=94061e9f-a959-4976-8cbd-70b93428ace6'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: [
          Column(
            children: [
              // play button
              const Spacer(),

              // caption
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(174, 255, 255, 255),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'This was when we went hiking on your birthday',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '10 years ago',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 123, 123, 123),
                                height: 1),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              // swipe down
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'swipe down',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  )
                ],
              ),
              const SizedBox(
                height: 45,
              ),
            ],
          ),
          Column(
            children: [
              const Spacer(),
              Center(
                child: GestureDetector(
                    child: ClipRRect(
                      //clip circle
                      borderRadius: BorderRadius.circular(100),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(99, 0, 0, 0),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            // child: Icon(
                            //     isPlaying ? Icons.pause : Icons.play_arrow,
                            //     color: Color(0xFFE8E0ED),
                            //     size: 80),
                            child: SvgPicture.asset(
                              isPlaying
                                  ? 'assets/icons/listening.svg'
                                  : 'assets/icons/play.svg',
                              width: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () async {
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
                        String url =
                            "https://firebasestorage.googleapis.com/v0/b/mnemo-53581.appspot.com/o/test.m4a?alt=media&token=f8cfffd3-e9d2-4a37-ade2-b08fcb3930ec";
                        await audioPlayer.play(UrlSource(url));

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
              ),
              const Spacer(),
            ],
          )
        ]),
      ),
    );
  }
}
