import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:paws/auth/auth.dart';
import 'package:paws/widgets/cta_buton.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    'Paws',
                    style: GoogleFonts.notoSerifDisplay(
                        fontSize: 35,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
            CarouselSlider(
              items: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Lottie.asset('assets/lottie/ani1.json'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: Text(
                        '"For all your furry family members"',
                        style: GoogleFonts.notoSerifDisplay(
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Lottie.asset('assets/lottie/ani2.json'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: Text(
                        '"Just like a paw, providing comfort and care for all pets"',
                        style: GoogleFonts.notoSerifDisplay(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                )
              ],
              options: CarouselOptions(
                autoPlay: true,
                enableInfiniteScroll: true,
                pageSnapping: true,
                viewportFraction: 1,
                height: 600,
                initialPage: 0,
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CTAButton(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AuthPage(),
              )),
              text: 'Get Started',
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Terms & Conditions apply'),
            )
          ],
        ),
      ),
    );
  }
}
