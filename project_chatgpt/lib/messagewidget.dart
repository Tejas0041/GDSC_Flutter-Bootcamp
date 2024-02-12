import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String text;
  final bool fromAi;

  const MessageWidget({super.key, required this.text, this.fromAi = false});

  @override
  Widget build(context) {
    return Align(
      alignment: fromAi ? Alignment.centerLeft : Alignment.centerRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * .8,
            ),
            margin: fromAi
                ? const EdgeInsets.only(left: 10)
                : const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: fromAi
                  ? Colors.white10
                  : const Color.fromARGB(255, 16, 163, 127),
              borderRadius: BorderRadius.circular(8).copyWith(
                bottomLeft: fromAi ? const Radius.circular(0) : null,
                bottomRight: !fromAi ? const Radius.circular(0) : null,
              ),
            ),
            padding: const EdgeInsets.all(12),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
