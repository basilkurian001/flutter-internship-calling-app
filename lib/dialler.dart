import 'package:flutter/material.dart';

class Dhome extends StatefulWidget {
  const Dhome({super.key});

  @override
  State<Dhome> createState() => _DhomeState();
}

class _DhomeState extends State<Dhome> {
  String typedNumber = '';

  void onKeyPressed(String digit) {
    setState(() {
      typedNumber += digit;
    });
  }

  void onBackspacePressed() {
    if (typedNumber.isNotEmpty) {
      setState(() {
        typedNumber = typedNumber.substring(0, typedNumber.length - 1);
      });
    }
  }

  Widget buildDialKey(String digit, {String? letters, IconData? icon}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onKeyPressed(digit),
        child: CircleAvatar(
          radius: 35,
          backgroundColor: Colors.grey.shade200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                digit,
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              if (letters != null)
                Text(letters, style: const TextStyle(color: Colors.grey, fontSize: 10)),
              if (icon != null)
                Icon(icon, size: 15, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.search, color: Colors.black),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.more_vert, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          // Display Typed Number
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                typedNumber,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Spacer(),

          // Keypad
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildDialKey("1", icon: Icons.voicemail_sharp),
                    const SizedBox(width: 20),
                    buildDialKey("2", letters: "ABC"),
                    const SizedBox(width: 20),
                    buildDialKey("3", letters: "DEF"),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildDialKey("4", letters: "GHI"),
                    const SizedBox(width: 20),
                    buildDialKey("5", letters: "JKL"),
                    const SizedBox(width: 20),
                    buildDialKey("6", letters: "MNO"),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildDialKey("7", letters: "PQRS"),
                    const SizedBox(width: 20),
                    buildDialKey("8", letters: "TUV"),
                    const SizedBox(width: 20),
                    buildDialKey("9", letters: "WXYZ"),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildDialKey("*"),
                    const SizedBox(width: 20),
                    buildDialKey("0", letters: "+"),
                    const SizedBox(width: 20),
                    buildDialKey("#"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    // Call Button + Backspace in a Row
    Padding(
  padding: const EdgeInsets.only(bottom: 10),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // Call Button (Always center-aligned)
      Padding(
        padding: const EdgeInsets.only(left: 80),
        child: CircleAvatar(
          backgroundColor: Colors.purple[400],
          radius: 35,
          child: Icon(Icons.phone, color: Colors.white, size: 35),
        ),
      ),
      const SizedBox(width: 20),

      // Backspace or Placeholder
      typedNumber.isNotEmpty
          ? MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: onBackspacePressed,
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  radius: 30,
                  child: Icon(Icons.backspace, color: Colors.black),
                ),
              ),
            )
          : const SizedBox(width: 60), // Same width as the backspace button
    ],
  ),
),

    // Bottom Nav Row
    Container(
      height: 40,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Keypad", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          SizedBox(width: 35),
          Text("Recents", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          SizedBox(width: 35),
          Text("Contacts", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        ],
      ),
    ),
  ],
),

    );
  }
}
