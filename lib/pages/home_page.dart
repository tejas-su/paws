import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paws/themes/themes.dart';
import 'package:paws/widgets/cta_buton.dart';
import 'package:paws/widgets/tabs_4.dart';
import 'package:paws/widgets/text_button_login.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  void logOut() {
    FirebaseAuth.instance.signOut();
  }

  final TextEditingController controller = TextEditingController();

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Container(
                  height: 150,
                  width: 380,
                  decoration: const BoxDecoration(
                      color: black,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Welcome\nBack 👋',
                          style: GoogleFonts.notoSerifDisplay(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: CircleAvatar(
                            radius: 50,
                            foregroundImage:
                                AssetImage('assets/images/dog1.jpeg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              LoginBtn1(
                controller: controller,
                hintText: 'Search....',
                obscureText: false,
                icon: const Icon(Icons.search_rounded),
              ),
              const SizedBox(
                height: 30,
              ),
              const Tabs4(
                  tab1: 'Cats', tab2: 'Dogs', tab3: 'Rabbit', tab4: 'More'),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: Image.asset(
                    'assets/images/dog1.jpeg',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CTAButton(text: 'Adopt Now', onTap: () {}),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: Image.asset(
                    'assets/images/cat1.jpeg',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CTAButton(text: 'Adopt Now', onTap: () {}),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
