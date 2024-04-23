import 'package:flutter/material.dart';
import 'package:social_media_app/pages/settings.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            onTap: (){
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => const SettingsPage())
              );
            },
            leading: const Icon(Icons.settings),
            title: const Text("S E T T I N G S"),
          )
        ]
      )
    );
  }
}