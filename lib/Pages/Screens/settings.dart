import 'package:baby_milestones_tracker/Authentication/auth.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final AuthService _auth = AuthService();
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "General",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            Expanded(
              flex: 1,
              child: ListTile(
                leading: const Icon(
                  Icons.notifications,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Notifications",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeTrackColor: Colors.blue.shade200,
                  activeColor: Colors.blue,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListTile(
                leading: const Icon(
                  Icons.local_drink_outlined,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Feed Notifications",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeTrackColor: Colors.blue.shade200,
                  activeColor: Colors.blue,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListTile(
                leading: const Icon(
                  Icons.timer,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Set Reminder",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeTrackColor: Colors.blue.shade200,
                  activeColor: Colors.blue,
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: ListTile(
                leading: Icon(
                  Icons.message_rounded,
                  color: Colors.blue,
                ),
                title: Text(
                  "FAQs",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: ListTile(
                leading: Icon(
                  Icons.star,
                  color: Colors.blue,
                ),
                title: Text(
                  "Rate us",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: ListTile(
                leading: Icon(
                  Icons.notifications,
                  color: Colors.blue,
                ),
                title: Text(
                  "Notifications",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: ListTile(
                leading: Icon(
                  Icons.contact_page,
                  color: Colors.blue,
                ),
                title: Text(
                  "Contact us",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: ListTile(
                leading: Icon(
                  Icons.book_rounded,
                  color: Colors.blue,
                ),
                title: Text(
                  "Terms of use",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: ListTile(
                leading: Icon(
                  Icons.delete,
                  color: Colors.blue,
                ),
                title: Text(
                  "Clear App Cash",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListTile(
                onTap: () {
                  _auth.signOut();
                },
                leading: const Icon(
                  Icons.logout_rounded,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
            Container(
              height: 1,
              color: Colors.grey[200],
              margin: const EdgeInsets.symmetric(vertical: 10),
            ),
          ],
        ),
      ),
    );
  }
}
