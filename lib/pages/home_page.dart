import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void logOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 35,
        automaticallyImplyLeading: false,
        title: Text(
          'Paws',
          style: GoogleFonts.notoSerifDisplay(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: logOut,
                icon: const Icon(
                  Icons.logout_rounded,
                  size: 30,
                )),
          )
        ],
      ),
      body: const Center(
        child: Text('You have successfully signed in'),
      ),
    );
  }
}
