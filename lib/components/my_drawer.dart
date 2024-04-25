import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:social_media_app/pages/settings.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Icon(Icons.favorite,
                color: Theme.of(context).colorScheme.inversePrimary
                )
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("H O M E"),
                  onTap:(){
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/home_page');
                  }
                ),
              ),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("P R O F I L E"),
                  onTap:(){
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/profile_page');
                  }
                ),
              ),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: ListTile(
                  leading: const Icon(Icons.group),
                  title: const Text("U S E R S"),
                  onTap:(){
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/users_page');
                  }
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 20),
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("L O G O U T"),
              onTap:(){
                    Navigator.pop(context);
                    FirebaseAuth.instance.signOut();
                  }
              ),
          ),
        ]
      )
    );
  }
}