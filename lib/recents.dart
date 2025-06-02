import 'package:flutter/material.dart';
import 'package:flutter_project_callingapp/contacts_page.dart';
import 'package:flutter_project_callingapp/dialler.dart';
import 'package:flutter_project_callingapp/home_screen.dart';

class CallLogScreen extends StatefulWidget {
  @override
  _CallLogScreenState createState() => _CallLogScreenState();
}

class _CallLogScreenState extends State<CallLogScreen> {
  final List<Map<String, dynamic>> callLogs = [
    {
      'name': 'Customer care',
      'time': '8:26 pm',
      'type': 'received',
      'day': 'Today',
    },
    {'name': 'Home (3)', 'time': '6:02 pm', 'type': 'outgoing', 'day': 'Today'},
    {
      'name': 'Aadithya shaji (2)',
      'time': '4:38 pm',
      'type': 'missed',
      'day': 'Today',
    },
    {
      'name': 'Amma (6)',
      'time': '12:17 pm',
      'type': 'received',
      'day': 'Today',
    },
    {
      'name': 'Archana',
      'time': '11:24 am',
      'type': 'outgoing',
      'day': 'Today',
    },
    {
      'name': '+91 984786416',
      'time': '11:20 am',
      'type': 'received',
      'day': 'Today',
    },
    {
      'name': 'Aleena',
      'time': '11:19 am',
      'type': 'outgoing',
      'day': 'Today',
    },
    {
      'name': 'Amma (3)',
      'time': '10:11 am',
      'type': 'received',
      'day': 'Today',
    },
    {
      'name': 'Adhithian mohananBCA (2)',
      'time': '9:57 pm',
      'type': 'outgoing',
      'day': 'Yesterday',
    },
    {'name': 'Amma', 'time': '6:52 pm', 'type': 'outgoing', 'day': 'Yesterday'},
    {
      'name': 'Susan',
      'time': '6:30 pm',
      'type': 'received',
      'day': 'Yesterday',
    },
    {
      'name': 'Adithya Bca',
      'time': '10:00 pm',
      'type': 'outgoing',
      'day': '24 May',
    },
    
  ];

  Icon _getCallIcon(String type) {
    switch (type) {
      case 'received':
        return Icon(Icons.call_received, color: Colors.green);
      case 'outgoing':
        return Icon(Icons.call_made, color: Colors.grey);
      case 'missed':
        return Icon(Icons.call_missed, color: Colors.red);
      default:
        return Icon(Icons.call, color: Colors.black);
    }
  }

  Widget _buildCallRow(Map<String, dynamic> log) {
    return ListTile(
      leading: _getCallIcon(log['type']),
      title: Text(log['name'], style: TextStyle(fontSize: 16)),
      subtitle: Text(log['time']),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.mic, size: 16),
          SizedBox(width: 4),
          Icon(Icons.sim_card_sharp, size: 16),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String? lastDay;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
        }, icon: Icon(Icons.arrow_back)),
        title: Text("Phone", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        actions: [
          Icon(Icons.filter_list, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.more_vert, color: Colors.black),
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: callLogs.length,
        itemBuilder: (context, index) {
          final log = callLogs[index];
          final bool showHeader = log['day'] != lastDay;
          lastDay = log['day'];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showHeader)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Text(
                    log['day'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
              _buildCallRow(log),
              Divider(height: 1),
            ],
          );
        },
      ),
      
      bottomNavigationBar: 
      Container(
  height: 60,
  width: double.infinity,
  color: Colors.white,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: () {
                  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Dhome()),
            );
        },
        child: const Text(
          "Keypad",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
      const SizedBox(width: 35),
      GestureDetector(
        onTap: () {
          print("Recents tapped");
        },
        child: const Text(
          "Recents",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      const SizedBox(width: 35),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContactsPage()),
            );
        },
        child: const Text(
          "Contacts",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
    ],
  ),
)

    );
  }
}