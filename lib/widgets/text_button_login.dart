import 'package:flutter/material.dart';
import 'package:paws/themes/themes.dart';

class LoginBtn1 extends StatelessWidget {
  final String hintText;
  final Icon? icon;
  final bool obscureText;
  final TextEditingController? controller;

  const LoginBtn1(
      {super.key,
      required this.hintText,
      required this.controller,
      this.icon,
      required this.obscureText});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        height: 60,
        foregroundDecoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(40), right: Radius.circular(40))),
        decoration: const BoxDecoration(
          borderRadius: BorderRadiusDirectional.horizontal(
            end: Radius.circular(40),
            start: Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(20),
              hintText: hintText,
              hintStyle:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              border: InputBorder.none,
              suffixIcon: icon,
              suffixIconColor: black,
            ),
          ),
        ),
      ),
    );
  }
}
