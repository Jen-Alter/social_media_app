import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media_app/helper/helper_functions.dart';

import '../components/my_button.dart';
import 'package:flutter/material.dart';
import '../components/text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController = TextEditingController();

  void registerUser() async{
    // SHOW: loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator()
      ),
    );

    // MAKE: sure passwords match
    if(passwordController.text != confirmPasswordController.text){
      Navigator.pop(context);

      // SHOW: error message when passwords don't match
      displayMessageToUser("Passwords don't match", context);
      return;
    }

    try{
      UserCredential? userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
        );

        Navigator.pop(context);
    }on FirebaseAuthException catch(e){
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary
              ),
              const SizedBox(height: 15),
              const Text("M I N I M A L", style: TextStyle(fontSize:30)),

              const SizedBox(height: 25),
              MyTextField(
                hintText: "Username",
                obscureText: false,
                controller: usernameController
              ),

              const SizedBox(height: 10),
              MyTextField(
                hintText: "Email",
                obscureText: false,
                controller: emailController
              ),

              const SizedBox(height: 10),
              MyTextField(
                hintText: "Password",
                obscureText: true,
                controller: passwordController
              ),

              const SizedBox(height: 10),
              MyTextField(
                hintText: "Confirm Password",
                obscureText: true,
                controller: confirmPasswordController,
              ),

              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot password?", style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary
                  ))
                ]
              ),
              const SizedBox(height: 15),
              MyButton(
                text: "R E G I S T E R",
                onTap: registerUser
              ),

              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: widget.onTap,
                    child: Text("Log in", style: TextStyle(
                      fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.inversePrimary,
                    )),
                  )
                ]
              )
            ]
          ),
        )
      )
    );
  }
}