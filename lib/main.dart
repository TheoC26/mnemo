import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mnemo_app/firebase_options.dart';
import 'package:mnemo_app/pages/caregiver/home.dart';
import 'package:mnemo_app/pages/onboarding/caregiver.dart';
import 'package:mnemo_app/pages/onboarding/onboard.dart';
import 'package:mnemo_app/pages/patient/memories.dart';
// import 'package:mnemo_app/pages/onboarding/patient.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Map user = {
      'type': 'caregiver',
      'id': '123',
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mnemo',
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      home: const Home(),
    );
  }
}
