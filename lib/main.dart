import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_callingapp/call_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'contacts_page.dart';
import 'dart:html' as html;
import 'package:flutter_project_callingapp/dialler.dart';
import 'package:flutter_project_callingapp/home_screen.dart';
import 'package:flutter_project_callingapp/recents.dart';
//import 'helper.dart';


void exportContactsToJson() {
  final box = Hive.box('contacts');
  final contacts = box.values.toList();

  final json = jsonEncode(contacts);
  final blob = html.Blob([json]);
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.AnchorElement(href: url)
    ..setAttribute("download", "my_contacts_export.json")
    ..click();
  html.Url.revokeObjectUrl(url);
}


Future<void> loadContactsFromAssetIfEmpty() async {
  final box = Hive.box('contacts');
  if (box.isEmpty) {
    final jsonString = await rootBundle.loadString('assets/contacts_backup.json');
    final List<dynamic> contacts = jsonDecode(jsonString);
    for (var contact in contacts) {
      box.add(contact);
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('contacts');
  await loadContactsFromAssetIfEmpty(); // auto-import JSON if empty
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Calling App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
      routes: {
        '/contacts': (context) => const ContactsPage(),
      },
    );
  }
}
/*
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/contacts'),
          child: const Text('Open Contacts'),
        ),
      ),
    );
  }
}
*/
