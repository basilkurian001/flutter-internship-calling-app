import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(CallSettingsApp());
}

class CallSettingsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Phone Call Settings',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey[200], // Android-like background
      ),
      home: CallSettingsPage(),
    );
  }
}

class CallSettingsPage extends StatefulWidget {
  @override
  _CallSettingsPageState createState() => _CallSettingsPageState();
}

class _CallSettingsPageState extends State<CallSettingsPage> {
  bool muteCalls = false;
  bool blockUnknown = false;
  bool voicemail = false;
  String simPreference = "SIM 1";

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  /// Load stored values
  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      muteCalls = prefs.getBool('muteCalls') ?? false;
      blockUnknown = prefs.getBool('blockUnknown') ?? false;
      voicemail = prefs.getBool('voicemail') ?? false;
      simPreference = prefs.getString('simPreference') ?? "SIM 1";
    });
  }

  /// Save values when changed
  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('muteCalls', muteCalls);
    prefs.setBool('blockUnknown', blockUnknown);
    prefs.setBool('voicemail', voicemail);
    prefs.setString('simPreference', simPreference);
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      color: Colors.grey[300],
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(title.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Call Settings")),
      body: ListView(
        children: [
          // SIM Section
          _buildSectionHeader("SIM Settings"),
          ListTile(
            leading: Icon(Icons.sim_card, color: Colors.blueGrey),
            title: Text("SIM Card Preference"),
            subtitle: Text(simPreference),
            trailing: DropdownButton<String>(
              value: simPreference,
              underline: SizedBox(),
              items: ["SIM 1", "SIM 2"].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (val) {
                setState(() => simPreference = val!);
                _saveSettings();
              },
            ),
          ),
          Divider(height: 0),

          // Call Control Section
          _buildSectionHeader("Call Controls"),
          SwitchListTile(
            secondary: Icon(Icons.volume_off, color: Colors.blueGrey),
            title: Text("Mute Calls"),
            subtitle: Text("Disable ringtone for all incoming calls"),
            value: muteCalls,
            onChanged: (val) {
              setState(() => muteCalls = val);
              _saveSettings();
            },
          ),
          SwitchListTile(
            secondary: Icon(Icons.block, color: Colors.blueGrey),
            title: Text("Block Unknown Numbers"),
            subtitle: Text("Reject hidden or private numbers"),
            value: blockUnknown,
            onChanged: (val) {
              setState(() => blockUnknown = val);
              _saveSettings();
            },
          ),
          SwitchListTile(
            secondary: Icon(Icons.voicemail, color: Colors.blueGrey),
            title: Text("Voicemail"),
            subtitle: Text("Forward calls to voicemail when unavailable"),
            value: voicemail,
            onChanged: (val) {
              setState(() => voicemail = val);
              _saveSettings();
            },
          ),
          Divider(height: 0),

          // Forwarding Section
          _buildSectionHeader("Forwarding"),
          ListTile(
            leading: Icon(Icons.forward_to_inbox, color: Colors.blueGrey),
            title: Text("Call Forwarding"),
            subtitle: Text("Manage call forwarding options"),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CallForwardingPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CallForwardingPage extends StatefulWidget {
  @override
  _CallForwardingPageState createState() => _CallForwardingPageState();
}

class _CallForwardingPageState extends State<CallForwardingPage> {
  bool alwaysForward = false;
  bool forwardWhenBusy = false;
  bool forwardWhenUnanswered = false;
  bool forwardWhenUnreachable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Call Forwarding")),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text("Always Forward"),
            subtitle: Text("Forward all calls"),
            value: alwaysForward,
            onChanged: (val) {
              setState(() => alwaysForward = val);
            },
          ),
          SwitchListTile(
            title: Text("When Busy"),
            subtitle: Text("Forward calls when line is busy"),
            value: forwardWhenBusy,
            onChanged: (val) {
              setState(() => forwardWhenBusy = val);
            },
          ),
          SwitchListTile(
            title: Text("When Unanswered"),
            subtitle: Text("Forward calls when unanswered"),
            value: forwardWhenUnanswered,
            onChanged: (val) {
              setState(() => forwardWhenUnanswered = val);
            },
          ),
          SwitchListTile(
            title: Text("When Unreachable"),
            subtitle: Text("Forward calls when unreachable"),
            value: forwardWhenUnreachable,
            onChanged: (val) {
              setState(() => forwardWhenUnreachable = val);
            },
          ),
        ],
      ),
    );
  }
}