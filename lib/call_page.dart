import 'package:flutter/material.dart';

class ContaCt extends StatefulWidget {
  final String name;
  final String phone;

  const ContaCt({Key? key, required this.name, required this.phone}) : super(key: key);

  @override
  State<ContaCt> createState() => _ContaCtState();
}

class _ContaCtState extends State<ContaCt> {
  final Color backgroundColor = Colors.black87;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Phone  ${widget.phone}',
                    style: TextStyle(color: Colors.white60, fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      callOption(Icons.add, "Add call"),
                      callOption(Icons.pause, "Hold call"),
                      callOption(Icons.bluetooth, "Bluetooth"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        callOption(Icons.volume_up, "Speaker"),
                        callOption(Icons.mic_off, "Mute"),
                        callOption(Icons.dialpad, "Keypad"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.call_end, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget callOption(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 30),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.white70)),
      ],
    );
  }
}
