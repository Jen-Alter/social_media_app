import 'package:flutter/material.dart';
import 'package:social_media_app/pages/login_page.dart';

import '../components/my_button.dart';
import '../components/text_field.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  RegisterPage({super.key});

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
              const SizedBox(height: 25),
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
                onTap: (){}
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: (){
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => LoginPage())
                      );
                    },
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