import 'package:flutter/material.dart';
import 'package:social_media_app/pages/register_page.dart';
import 'package:social_media_app/components/my_button.dart';
import 'package:social_media_app/components/my_drawer.dart';
import 'package:social_media_app/components/text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
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
                text: "L O G I N",
                onTap: (){}
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: (){
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => RegisterPage())
                      );
                    },
                    child: Text("Sign up", style: TextStyle(
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