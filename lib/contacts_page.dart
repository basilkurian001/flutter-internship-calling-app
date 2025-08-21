//import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter_project_callingapp/dialler.dart';
import 'package:flutter_project_callingapp/home_screen.dart';
import 'package:flutter_project_callingapp/recents.dart';
import 'package:flutter_project_callingapp/call_page.dart'; // Make sure this import exists
import 'package:hive/hive.dart';
import 'package:flutter_project_callingapp/message.dart';
import 'package:flutter_project_callingapp/settings_page.dart';
//import 'package:http/http.dart' as http;


class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  late Box contactsBox;
  int _expandedIndex = -1;
  String _searchQuery = "";
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    contactsBox = Hive.box('contacts');
  }

  void _addContact(String name, String phone) async{
    final newContact = {'name': name, 'phone': phone};
    contactsBox.add(newContact);
    //await http.post(
    //Uri.parse("http://192.168.56.1/calling_app/add_contact.php"),
    //Uri.parse("http://127.0.0.1/calling_app/add_contact.php"),
    //body: {"name": name, "phone": phone},
  //);
  }

  void _deleteContact(dynamic key) {
    contactsBox.delete(key);
    setState(() {
      _expandedIndex = -1;
    });
  }

  void _showAddContactDialog() {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Contact'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _addContact(nameController.text, phoneController.text);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(dynamic key) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Contact"),
        content: const Text("Are you sure you want to delete this contact?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _deleteContact(key);
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }

  List<MapEntry<dynamic, Map<dynamic, dynamic>>> _getSortedAndFilteredContacts() {
    final entries = contactsBox.toMap().cast<dynamic, Map<dynamic, dynamic>>().entries.toList();

    final filtered = entries.where((entry) {
      return entry.value['name']
          .toString()
          .toLowerCase()
          .contains(_searchQuery.toLowerCase());
    }).toList();

    filtered.sort((a, b) => a.value['name']
        .toString()
        .toLowerCase()
        .compareTo(b.value['name'].toString().toLowerCase()));

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    final List<MapEntry<dynamic, Map>> contacts = _getSortedAndFilteredContacts();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
                onChanged: (val) {
                  setState(() {
                    _searchQuery = val;
                  });
                },
              )
            : const Text("Phone", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: _showAddContactDialog,
            icon: const Icon(Icons.add, color: Colors.black),
          ),
          IconButton(
            icon: Icon(
              _isSearching ? Icons.close : Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                _searchQuery = "";
                _searchController.clear();
              });
            },
          ),
          const SizedBox(width: 8),
                    PopupMenuButton<String>(
        icon: Icon(Icons.more_vert, color: Colors.black), // 3-dot icon
        onSelected: (value) {
          if (value == "settings") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CallSettingsPage(), // 👈 create this page
              ),
            );
          } 
        },
        itemBuilder: (BuildContext context) {
          return [
            const PopupMenuItem(
              value: "settings",
              child: Text("Settings"),
            ),
            const PopupMenuItem(
              value: "help",
              child: Text("Help"),
            ),
          ];
        },
      ),
          const SizedBox(width: 8),
        ],
      ),
      body: contacts.isEmpty
          ? const Center(child: Text('No contacts found.'))
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contactEntry = contacts[index];
                final contact = contactEntry.value;
                final key = contactEntry.key;
                final isExpanded = _expandedIndex == index;

                return Dismissible(
  key: ValueKey(key),
  direction: DismissDirection.horizontal, // allow both swipes
  confirmDismiss: (direction) async {
    if (direction == DismissDirection.startToEnd) {
      // Swipe RIGHT → open call page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ContaCt(
            name: contact['name'],
            phone: contact['phone'],
          ),
        ),
      );
      return false; // Prevent actual dismissal
    } else if (direction == DismissDirection.endToStart) {
      // Swipe LEFT → open message page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AnnelenkinsChatPage(
            name: contact['name'],
          ),
        ),
      );
      return false; // Prevent dismissal
    }
    return false;
  },

  // RIGHT swipe background (call)
  background: Container(
    color: Colors.green,
    alignment: Alignment.centerLeft,
    padding: const EdgeInsets.only(left: 20),
    child:IconButton(onPressed: (){
       Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ContaCt(
            name: contact['name'],
            phone: contact['phone'],
          ),
        ),
      );
    }, icon: Icon(Icons.call)),

    
  ),

  // LEFT swipe background (message)
  secondaryBackground: Container(
    color: Colors.blue,
    alignment: Alignment.centerRight,
    padding: const EdgeInsets.only(right: 20),
    child: const Icon(Icons.message, color: Colors.white),
  ),

  child: Column(
    children: [
      ListTile(
        title: Text(contact['name']),
        onTap: () {
          setState(() {
            _expandedIndex = isExpanded ? -1 : index;
          });
        },
        onLongPress: () => _showDeleteConfirmation(key),
      ),
      if (isExpanded)
        Padding(
          padding: const EdgeInsets.only(left: 72.0, right: 16, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Phone ${contact['phone']}"),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: (){
                                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContaCt(
                              name: contact['name'],
                              phone: contact['phone'],
                            ),
                          ),
                        );
                  }, icon: Icon(Icons.call,color: Colors.green,)),

                  IconButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AnnelenkinsChatPage(
                              name: contact['name'],
                            ),
                          ),
                        );
                  }, icon: Icon(Icons.message, color: Colors.blue),),
                  Icon(Icons.video_call, color: Colors.orange),
                  Icon(Icons.info, color: Colors.grey),
                ],
              ),
            ],
          ),
        ),
      const Divider(),
    ],
  ),
);

              },
            ),
      bottomNavigationBar: Container(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CallLogScreen()),
                );
              },
              child: const Text(
                "Recents",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ),
            const SizedBox(width: 35),
            const Text(
              "Contacts",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
