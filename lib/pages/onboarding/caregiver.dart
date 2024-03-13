import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mnemo_app/components/button_full.dart';
import 'package:mnemo_app/components/color_background.dart';
import 'package:mnemo_app/components/input_full.dart';
import 'package:mnemo_app/pages/onboarding/caregiver_connect.dart';

class Caregiver extends StatefulWidget {
  const Caregiver({Key? key}) : super(key: key);

  @override
  _CaregiverState createState() => _CaregiverState();
}

class _CaregiverState extends State<Caregiver> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();

  void registerUser() async {
    try {
      //  Register user
      UserCredential? userCredential =
          await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future<void> createUserDocument(UserCredential? userCredential) async {
    try {
      if (userCredential == null) return;
      await FirebaseFirestore.instance
          .collection('CaregiverUsers')
          .doc(userCredential.user!.uid)
          .set({
        'name': nameController.text,
        'dementiaUsers': [idController.text],
      });
    } catch (e) {
      print('Failed to create user document: $e');
      // You can handle the exception here, for example, by showing an error message to the user
    }
  }

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
          'Caregiver',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: ColorBackground(
          child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 40),
            child: Text(
              'Please enter the ID of the patient you are caring for',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
            ),
          ),
          InputFull(controller: nameController, hintText: "Your name..."),
          InputFull(controller: idController, hintText: "ID..."),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Text(
              'If you do not know the ID of the patient, navigate to their profile on their app',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Spacer(flex: 1),
          ButtonFull(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => CaregiverConnect(
                    name: nameController.text,
                    id: idController.text,
                  ),
                ),
              );
            },
            text: 'Continue',
            color: "grey",
          ),
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom < 50 ? 100 : 20,
          ),
        ],
      )),
    );
  }
}
