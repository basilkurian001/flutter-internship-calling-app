import 'package:flutter/material.dart';
import 'package:flutter_project_callingapp/dialler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background container
          Container(color: Colors.white),

          // Phone screenshot image
          Image.asset("phone_homescreen_screenshot.jpg"),

          // Positioned invisible IconButton (still clickable)
          Positioned(
            top: 615,
            left: 45,
            child: Opacity(
              opacity: 0.0,
              child: IconButton(
                icon: Icon(Icons.call, color: Colors.green),
                onPressed: () {
                  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Dhome()),
            );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}