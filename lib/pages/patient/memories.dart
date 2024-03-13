import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mnemo_app/components/formatted_text.dart';
import 'package:mnemo_app/components/memory_page.dart';

class Memories extends StatefulWidget {
  const Memories({Key? key}) : super(key: key);

  @override
  _MemoriesState createState() => _MemoriesState();
}

class _MemoriesState extends State<Memories> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        scrollBehavior: const MaterialScrollBehavior(),
        children: [
          Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  const Text('Good afternoon,', style: TextStyle(fontSize: 16)),
                  const Text('Robert Smith',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                          height: 1.1)),
                  const SizedBox(height: 60),
                  const FormattedText(
                      before: "You have", bold: "7", after: "new memories"),
                  const FormattedText(
                      before: "And", bold: "3", after: "upcoming reminders"),
                  const SizedBox(height: 60),
                  const Text('Upcoming',
                      style: TextStyle(fontSize: 24, height: 2)),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 20),
                  const FormattedText(
                      before: "In", bold: "10 minutes,", after: "take a walk"),
                  const SizedBox(height: 20),
                  const FormattedText(
                      before: "At",
                      bold: "7pm,",
                      after: "take your medications"),
                  const Spacer(),
                  Center(
                    child: Column(
                      children: [
                        const Text('Scroll down to see your memories',
                            style: TextStyle(fontSize: 16)),
                        Transform.rotate(
                          angle: pi / 2,
                          child: const Icon(
                            Icons.chevron_right_rounded,
                            size: 50,
                          ),
                        ),
                        const SizedBox(height: 20)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const MemoryPage(),
          Container(
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
