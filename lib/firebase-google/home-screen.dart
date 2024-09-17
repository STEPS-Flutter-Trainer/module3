
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:module3/firebase-google/profile-screen.dart';
import 'package:module3/firebase-google/signin-screen.dart';

class HomeScreen extends StatelessWidget {

  Future<void> _signOut(BuildContext context) async {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    // Navigate back to SignInScreen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => SignInScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
