import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mnemo_app/components/color_background.dart';

class CaregiverConnect extends StatefulWidget {
  final String name;
  final String id;
  const CaregiverConnect({Key? key, required this.name, required this.id})
      : super(key: key);

  @override
  _CaregiverConnectState createState() => _CaregiverConnectState();
}

class _CaregiverConnectState extends State<CaregiverConnect> {
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
                height: 50,
                width: double.infinity,
              ),
              Center(
                child: Column(
                  children: [
                    const Text(
                      'A request has been sent to',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.id,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          height: 1.6),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                          'please wait until it is accepted before continuing...',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 1.2)),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
