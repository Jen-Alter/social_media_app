import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  // GET: current logged in user
  User? currentUser = FirebaseAuth.instance.currentUser;

  // FUTURE: to fetch the users details from firebase
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async{
    return await FirebaseFirestore.instance
      .collection("Users")
      .doc(currentUser!.email)
      .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("P R O F I L E"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: (context, snapshot){

          // LOADING:
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }

          // ERROR:
          else if(snapshot.hasError){
            return Text("Error: ${snapshot.error}");
          }

          // SUCCESS:
          else if(snapshot.hasData){
            // EXTRACT: Extracting the data
            Map<String, dynamic>? user = snapshot.data!.data();

            return Center(
              child: Column(
                children: [
                  Text(user!['email']),
                  Text(user['username'])
                ]
              ),
            );
          }else{
            return const Text("No data");
          }
        }
      )
    );
  }
}