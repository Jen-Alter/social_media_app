import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social_media_app/auth/auth.dart';
import 'package:social_media_app/themes/dark.dart';
import 'package:social_media_app/themes/light.dart';
import 'package:social_media_app/firebase_options.dart';

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
      home: const AuthPage()
    );
  }
}