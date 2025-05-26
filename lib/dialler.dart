import 'package:flutter/material.dart';

class Dhome extends StatefulWidget {
  const Dhome({super.key});

  @override
  State<Dhome> createState() => _DhomeState();
}

class _DhomeState extends State<Dhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        actions: [
          Icon(Icons.search, color: Colors.black),

          Icon(Icons.more_vert, color: Colors.black),
        ],
      ),

      body: Container(
        color: Colors.white,

        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 50),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,

                    child: Column(
                      children: [
                        SizedBox(height: 5),

                        Center(
                          child: Text(
                            "1",

                            style: TextStyle(
                              fontSize: 25,

                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Icon(
                          Icons.voicemail_sharp,

                          size: 15,

                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 20),

                  CircleAvatar(
                    radius: 30,

                    child: Column(
                      children: [
                        SizedBox(height: 5),

                        Text(
                          "2",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "ABC",

                          style: TextStyle(color: Colors.grey, fontSize: 8),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 20),

                  CircleAvatar(
                    radius: 30,

                    child: Column(
                      children: [
                        SizedBox(height: 5),

                        Text(
                          "3",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "DEF",

                          style: TextStyle(color: Colors.grey, fontSize: 8),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Row(
                children: [
                  CircleAvatar(
                    radius: 30,

                    child: Column(
                      children: [
                        SizedBox(height: 5),

                        Text(
                          "4",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "GHI",

                          style: TextStyle(color: Colors.grey, fontSize: 8),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 20),

                  CircleAvatar(
                    radius: 30,

                    child: Column(
                      children: [
                        SizedBox(height: 5),

                        Text(
                          "5",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "JKL",

                          style: TextStyle(color: Colors.grey, fontSize: 8),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 20),

                  CircleAvatar(
                    radius: 30,

                    child: Column(
                      children: [
                        SizedBox(height: 5),

                        Text(
                          "6",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "MNO",

                          style: TextStyle(color: Colors.grey, fontSize: 8),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Row(
                children: [
                  CircleAvatar(
                    radius: 30,

                    child: Column(
                      children: [
                        SizedBox(height: 5),

                        Text(
                          "7",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "PQRS",

                          style: TextStyle(color: Colors.grey, fontSize: 8),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 20),

                  CircleAvatar(
                    radius: 30,

                    child: Column(
                      children: [
                        SizedBox(height: 5),

                        Text(
                          "8",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "TUV",

                          style: TextStyle(color: Colors.grey, fontSize: 8),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 20),

                  CircleAvatar(
                    radius: 30,

                    child: Column(
                      children: [
                        SizedBox(height: 5),

                        Text(
                          "9",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "WXYZ",

                          style: TextStyle(color: Colors.grey, fontSize: 8),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Row(
                children: [
                  CircleAvatar(
                    radius: 30,

                    child: Column(
                      children: [
                        SizedBox(height: 5),

                        Text(
                          "*",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 20),

                  CircleAvatar(
                    radius: 30,

                    child: Column(
                      children: [
                        SizedBox(height: 5),

                        Text(
                          "0",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "+",

                          style: TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 20),

                  CircleAvatar(
                    radius: 30,

                    child: Column(
                      children: [
                        SizedBox(height: 5),

                        Center(
                          child: Text(
                            "#",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsetsDirectional.only(end: 50),

                child: CircleAvatar(
                  backgroundColor: Colors.purple[400],

                  radius: 30,

                  child: Icon(Icons.phone, color: Colors.white, size: 35),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        height: 40,

        width: 100,

        color: Colors.white,

        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 50.0),

          child: Row(
            children: [
              Text("Keypad", style: TextStyle(fontWeight: FontWeight.bold)),

              SizedBox(width: 35),

              Text("Recents", style: TextStyle(fontWeight: FontWeight.bold)),

              SizedBox(width: 35),

              Text("Contacts", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}