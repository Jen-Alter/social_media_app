import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("U S E R S"),
        centerTitle: true,
        backgroundColor: Colors.red,
      )
    );
  }
}