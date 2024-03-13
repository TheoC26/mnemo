import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mnemo_app/components/button_full.dart';
import 'package:mnemo_app/components/color_background.dart';
import 'package:mnemo_app/components/input_full.dart';
import 'package:mnemo_app/pages/onboarding/patient_connect.dart';

class Patient extends StatefulWidget {
  const Patient({Key? key}) : super(key: key);

  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<Patient> with SingleTickerProviderStateMixin {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  void registerUser() async {
    try {
      //  Register user
      UserCredential? userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      // userCredential!.user!.uid;

      // Add a new document with a generated id.
      createUserDocument(userCredential);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future<void> createUserDocument(UserCredential? userCredential) async {
    try {
      if (userCredential == null) return;
      await FirebaseFirestore.instance
          .collection('DementiaUsers')
          .doc(userCredential.user!.uid)
          .set({
        'name': nameController.text,
        'age': ageController.text,
        'caregivers': [],
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
          'Patient',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: ColorBackground(
          child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: Text(
              'Please fill out a few quick questions about the patient',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          InputFull(controller: nameController, hintText: "Name..."),
          InputFull(
            controller: ageController,
            hintText: "Age...",
            keyboardType: TextInputType.number,
          ),
          const Spacer(flex: 1),
          ButtonFull(
            onPressed: () {
              // check if the fields are empty
              if (nameController.text.isEmpty || ageController.text.isEmpty) {
                return;
              }
              //  Register user
              registerUser();
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) =>
                      PatientConnect(name: nameController.text),
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
