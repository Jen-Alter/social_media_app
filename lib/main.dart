import 'package:flutter/material.dart';
import 'package:social_media_app/auth/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social_media_app/themes/dark.dart';
import 'package:social_media_app/themes/light.dart';
import 'package:social_media_app/pages/homepage.dart';
import 'package:social_media_app/pages/users_page.dart';
import 'package:social_media_app/firebase_options.dart';
import 'package:social_media_app/pages/profile_page.dart';
import 'package:social_media_app/auth/login_or_register.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      darkTheme: darkMode,
      debugShowCheckedModeBanner: false,
      routes: {
        '/login_register_page': (context) => const LoginOrRegister(),
        '/home_page': (context) => const HomePage(),
        '/profile_page': (context) => const ProfilePage(),
        '/users_page': (context) => const UsersPage(),
      },
      home: const AuthPage()
    );
  }
}