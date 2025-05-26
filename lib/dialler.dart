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
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.search, color: Colors.black),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.more_vert, color: Colors.black),
          ),
        ],
      ),

      body: 
      Padding(
        padding: const EdgeInsets.only(left: 70),
        child: Container(
          color: Colors.white,
        
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 70),
        
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
        
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
        
                      child: Column(
                        children: [
                          SizedBox(height: 5),
        
                          Center(
                            child: Text(
                              "1",
        
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
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
                      radius: 35,
        
                      child: Column(
                        children: [
                          SizedBox(height: 5),
        
                          Text(
                            "2",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
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
                      radius: 35,
        
                      child: Column(
                        children: [
                          SizedBox(height: 5),
        
                          Text(
                            "3",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
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
                      radius: 35,
        
                      child: Column(
                        children: [
                          SizedBox(height: 5),
        
                          Text(
                            "4",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
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
                      radius: 35,
        
                      child: Column(
                        children: [
                          SizedBox(height: 5),
        
                          Text(
                            "5",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
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
                      radius: 35,
        
                      child: Column(
                        children: [
                          SizedBox(height: 5),
        
                          Text(
                            "6",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
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
                      radius: 35,
        
                      child: Column(
                        children: [
                          SizedBox(height: 5),
        
                          Text(
                            "7",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
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
                      radius: 35,
        
                      child: Column(
                        children: [
                          SizedBox(height: 5),
        
                          Text(
                            "8",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
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
                      radius: 35,
        
                      child: Column(
                        children: [
                          SizedBox(height: 5),
        
                          Text(
                            "9",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
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
                      radius: 35,
        
                      child: Column(
                        children: [
                          SizedBox(height: 5),
        
                          Text(
                            "*",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
        
                    SizedBox(width: 20),
        
                    CircleAvatar(
                      radius: 35,
        
                      child: Column(
                        children: [
                          SizedBox(height: 5),
        
                          Text(
                            "0",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
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
                      radius: 35,
        
                      child: Column(
                        children: [
                          SizedBox(height: 5),
        
                          Center(
                            child: Text(
                              "#",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        
                SizedBox(height: 30),
        /*
                CircleAvatar(
                  backgroundColor: Colors.purple[400],
                        
                  radius: 30,
                        
                  child: Icon(Icons.phone, color: Colors.white, size: 35),
                ),
        */
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    // ✅ Centered Call Icon
    Padding(
      padding: const EdgeInsets.only(bottom: 10,left: 20),
      child: CircleAvatar(
        backgroundColor: Colors.purple[400],
        radius: 35,
        child: Icon(Icons.phone, color: Colors.white, size: 35),
      ),
    ),

    // 👇 Your bottom nav bar
    Container(
      height: 40,
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 145.0,),
        child: Row(
          children: [
            Text("Keypad", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
            SizedBox(width: 35),
            Text("Recents", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey)),
            SizedBox(width: 35),
            Text("Contacts", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey)),
          ],
        ),
      ),
    ),
  ],
),
    );
  }
}