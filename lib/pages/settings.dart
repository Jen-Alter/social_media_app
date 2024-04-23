import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("S E T T I N G S"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Dark Mode"),
                  CupertinoSwitch(
                    value: true,
                    onChanged: (value){}
                  )
                ]
              )
            ]
          )
        ),
      )
    );
  }
}