import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paws/themes/themes.dart';
import 'package:paws/widgets/cta_buton.dart';
import 'package:paws/widgets/show_message.dart';
import 'package:paws/widgets/text_button_login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Future<void> signUp() async {
    //show loading circle
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    //make sure the password match
    if (passwordController.text != confirmPasswordController.text) {
      Navigator.pop(context);
      //show error message
      showMessage('Passwords dosen\'t match', context);
    }
    //create user using firebase auth
    else {
      try {
        //UserCredential? userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: confirmPasswordController.text);

        //remove loading circle
        Navigator.pop(context);
        //show account created
        showMessage('Account Created Successfully', context);
      } on FirebaseAuthException catch (e) {
        //pop the loading circle
        Navigator.pop(context);
        //show the error message to the user
        showMessage('$e', context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Center(
                    child: Text(
                  'English',
                  style: TextStyle(fontWeight: FontWeight.w200),
                )),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Your pet\'s happy place',
                  style: GoogleFonts.notoSerifDisplay(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: Image.asset(
                      'assets/images/dog_training_login_screen.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    height: 500,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            'Paws',
                            style: GoogleFonts.notoSerifDisplay(
                                fontSize: 35,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          LoginBtn1(
                            controller: emailController,
                            hintText: 'happypaws@paws.com',
                            obscureText: false,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          LoginBtn1(
                            controller: passwordController,
                            hintText: 'Password',
                            icon: const Icon(Icons.lock_outline_rounded),
                            obscureText: false,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          LoginBtn1(
                            controller: confirmPasswordController,
                            hintText: 'Confirm Password',
                            icon: const Icon(Icons.lock_outline_rounded),
                            obscureText: false,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CTAButton(
                            text: 'Signup',
                            onTap: signUp,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            color: grey,
                            indent: 20,
                            endIndent: 20,
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Have an account? '),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop(
                                    MaterialPageRoute(
                                      builder: (context) => const SignUpPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Signin now',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
