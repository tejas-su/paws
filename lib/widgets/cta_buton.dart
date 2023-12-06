import 'package:flutter/material.dart';

class CTAButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const CTAButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          height: 60,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(26, 26, 26, 1),
            borderRadius: BorderRadiusDirectional.horizontal(
              end: Radius.circular(40),
              start: Radius.circular(40),
            ),
          ),
          child: Center(
              child: Text(
            text,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          )),
        ),
      ),
    );
  }
}
