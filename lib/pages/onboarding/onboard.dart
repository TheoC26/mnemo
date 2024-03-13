import 'package:flutter/material.dart';
import 'package:mnemo_app/components/button_full.dart';
import 'package:flutter/cupertino.dart';
import 'package:mnemo_app/components/color_background.dart';
import 'package:mnemo_app/pages/onboarding/caregiver.dart';
import 'patient.dart';

void navigateToPatientPage(BuildContext context) {
  Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (context) => const Patient(),
    ),
  );
}

void navigateToCaregiverPage(BuildContext context) {
  Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (context) => const Caregiver(),
    ),
  );
}

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ColorBackground(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 300),
            width: double.infinity,
            child: const Column(
              children: [
                Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text('Mnemo',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        height: .75)),
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          const Text(
            'This is for a',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          ButtonFull(
            text: "Patient",
            color: "purple",
            onPressed: () {
              navigateToPatientPage(context);
            },
          ),
          ButtonFull(
            text: "Caregiver",
            color: "grey",
            onPressed: () {
              navigateToCaregiverPage(context);
            },
          ),
          const SizedBox(
            height: 100,
          )
        ]),
      ),
    );
  }
}
