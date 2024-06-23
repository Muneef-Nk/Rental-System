import 'package:flutter/material.dart';
import 'package:rent_cruise/view/Profile/passwordManager.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Settings",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.sizeOf(context).height * .6,
              child: ListView(children: [
                Divider(),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward),
                    title: Text("Notification Settings"),
                    leading: Icon(Icons.person),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PasswordManager(),
                      ),
                    );
                  },
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward),
                    title: Text("Password Manager"),
                    leading: Icon(Icons.key),
                  ),
                ),
                Divider(),
                ListTile(
                  trailing: Icon(Icons.arrow_forward),
                  title: Text("Delete Account"),
                  leading: Icon(Icons.delete),
                ),
                Divider(),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
