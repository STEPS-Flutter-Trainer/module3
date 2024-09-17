import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _logout() async {
   await FirebaseAuth.instance.signOut();
   await GoogleSignIn().signOut();
  }

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (user != null) ...[
              Text('Name: ${user.displayName ?? "No name"}'),
              Text('Email: ${user.email ?? "No email"}'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _logout,
                child: Text("Logout"),
              ),
            ] else ...[
              Text('No user is signed in.'),
            ],
          ],
        ),
      ),
    );
  }
}
