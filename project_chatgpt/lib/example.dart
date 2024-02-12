import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  const Example({super.key, required this.text});

  final String text;

  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      //instead of using sizedbox, I used margin property of container
      decoration: BoxDecoration(
        color: const Color.fromARGB(50, 255, 255, 255),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 36),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
