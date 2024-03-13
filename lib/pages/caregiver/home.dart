import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mnemo_app/components/button_full.dart';
import 'package:mnemo_app/pages/caregiver/send_memory.dart';
import 'package:mnemo_app/pages/caregiver/view_memory.dart';
import 'package:mnemo_app/styles/background_styles.dart';

void navigateToSendMemoryPage(BuildContext context) {
  Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (context) => const SendMemory(),
    ),
  );
}

void navigateToViewMemoryPage(BuildContext context) {
  Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (context) => const ViewMemory(),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CARING FOR',
                    style: TextStyle(color: Color(0xff676767), fontSize: 10),
                  ),
                  Row(
                    children: [
                      Text(
                        'Emily',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.settings)
            ],
          ),
        ),
      ),
      body: Stack(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Recent',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: .8,
                  ),
                ),
                // for loop of 20 times
                for (var i = 0; i < 20; i++)
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          navigateToViewMemoryPage(context);
                        },
                        child: Container(
                          decoration: greyBackgroundDecoration,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Image.asset(
                                          'assets/temp/familyPicture.png',
                                          fit: BoxFit.cover,
                                          height: 100,
                                        ),
                                      ),
                                      Expanded(
                                        child: Image.asset(
                                          'assets/temp/graduationPicture.png',
                                          fit: BoxFit.cover,
                                          height: 100,
                                        ),
                                      ),
                                      Expanded(
                                        child: Stack(
                                          children: [
                                            Image.asset(
                                              'assets/temp/sisterPicture.png',
                                              fit: BoxFit.cover,
                                              height: 100,
                                              width: double.infinity,
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 100,
                                              alignment: Alignment.center,
                                              color: Color.fromARGB(
                                                  204, 123, 123, 123),
                                              child: Text(
                                                '+3',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Text(
                                    'Emily responded to two memories and saved one',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '1 hour ago',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff696969)),
                                      ),
                                      Row(
                                        children: [
                                          Text('view',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600)),
                                          Icon(
                                            Icons.keyboard_arrow_right,
                                            size: 20,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
              ],
            ),
          ),
        ),
        Column(
          children: [
            Spacer(),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0),
                    Colors.white.withOpacity(1),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 150,
              color: Colors.white,
            )
          ],
        ),
        Column(
          children: [
            Spacer(),
            ButtonFull(
              text: 'Send a memory',
              color: 'purple',
              onPressed: () {
                navigateToSendMemoryPage(context);
              },
              size: 16,
            ),
            ButtonFull(
                text: 'Add a reminder',
                color: 'grey',
                onPressed: () {},
                size: 16),
            SizedBox(
              height: 40,
            )
          ],
        )
      ]),
    );
  }
}
