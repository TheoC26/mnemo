import 'package:flutter/material.dart';

class ViewMemory extends StatefulWidget {
  const ViewMemory({Key? key}) : super(key: key);

  @override
  _ViewMemoryState createState() => _ViewMemoryState();
}

class _ViewMemoryState extends State<ViewMemory> {
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
      body: Column(
        children: [
          const Text('Memory'),
          const Text('Date'),
          const Text('Time'),
          const Text('Location'),
          const Text('Description'),
        ],
      ),
    );
  }
}
