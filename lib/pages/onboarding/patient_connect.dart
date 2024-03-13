import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mnemo_app/components/color_background.dart';
import 'package:mnemo_app/styles/background_styles.dart';
import 'package:share_plus/share_plus.dart';

class PatientConnect extends StatefulWidget {
  final String name;

  const PatientConnect({Key? key, required this.name}) : super(key: key);

  @override
  _PatientConnectState createState() => _PatientConnectState();
}

class _PatientConnectState extends State<PatientConnect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              CupertinoIcons.back,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Patient',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: ColorBackground(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                    fontSize: 36, fontWeight: FontWeight.w400, height: .8),
              ),
              Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'Your personal ID is:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500, height: 2.5),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // show share screen
                  Share.share('23LKJS23042');
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: purpleBackgroundDecoration,
                  child: const Text(
                    '23LKJS23042',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  'Only share this ID with people you trust',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Text(
                  'Caregivers',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                height: 330,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: greyBackgroundDecoration,
                child: const Text(
                  'No caregivers have partnered with you yet...',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 67, 67, 67),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
